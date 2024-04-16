/*********************************************************************
 *
 * Software License Agreement (BSD License)
 *
 * Copyright (c) 2020 LAAS/CNRS
 * All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above
 *     copyright notice, this list of conditions and the following
 *     disclaimer in the documentation and/or other materials provided
 *     with the distribution.
 *   * Neither the name of the institute nor the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 *  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 *  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 *  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 *  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 *  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 *  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 *  POSSIBILITY OF SUCH DAMAGE.
 *
 * Author: Phani Teja Singamaneni (email:ptsingaman@laas.fr)
 *********************************************************************/
 
#ifndef HUMAN_LAYERS_H
#define HUMAN_LAYERS_H
#include <ros/ros.h>
#include <tf2/utils.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <costmap_2d/layer.h>
#include <costmap_2d/layered_costmap.h>
#include <human_msgs/TrackedHumans.h>
#include <human_msgs/StateArray.h>
#include <human_msgs/TrackedSegmentType.h>
#include <dynamic_reconfigure/server.h>
#include <boost/thread.hpp>
#include <math.h>
// for group gaussian
#include <cmath>
#include <vector>
using namespace std;

#define PI 3.14159265359

namespace human_layers
{
class HumanLayer : public costmap_2d::Layer
{
public:
  HumanLayer()
  {
    layered_costmap_ = NULL;
  }

  virtual void onInitialize();
  virtual void updateBounds(double origin_x, double origin_y, double origin_yaw, double* min_x, double* min_y,
                            double* max_x, double* max_y);
  virtual void updateCosts(costmap_2d::Costmap2D& master_grid, int min_i, int min_j, int max_i, int max_j) = 0;

  virtual void updateBoundsFromHumans(double* min_x, double* min_y, double* max_x, double* max_y) = 0;

  bool isDiscretized()
  {
    return false;
  }

protected:
  struct HumanPoseVel{
    std_msgs::Header header;
    geometry_msgs::Pose pose;
    geometry_msgs::Twist velocity;
  };

  void humansCB(const human_msgs::TrackedHumans& humans);

  void statesCB(const human_msgs::StateArray& states);

  double Guassian1D(double x, double x0, double A, double varx){
    double dx = x-x0;
    return A*exp(-pow(dx,2.0)/(2.0*varx));
  }

  double Static_Individual_Gaussian2D(double x, double y, double x0, double y0, double A, double varx, double vary)
  {
    double dx = x - x0, dy = y - y0;
    double d = sqrt(dx * dx + dy * dy);
    double theta = atan2(dy, dx);
    double X = d*cos(theta), Y = d*sin(theta);
    double scale = 10;//3
    return (A/2)/std::max(d,1.0) * Guassian1D(X,0.0,1.0,varx/scale) * Guassian1D(Y,0.0,1.0,vary/scale);
  }

  double Gaussian2D_skewed(double x, double y, double x0, double y0, double A, double varx, double vary, double skew_ang)
  {
    double dx = x - x0, dy = y - y0;
    double d = sqrt(dx * dx + dy * dy);
    double theta = atan2(dy, dx);
    double X = d*cos(theta-skew_ang), Y = d*sin(theta-skew_ang);
    return A/std::max(d,1.0) * Guassian1D(X,0.0,1.0,varx) * Guassian1D(Y,0.0,1.0,vary);
  }

  double getRadius(double cutoff, double A, double var)
  {
    return sqrt(-2 * var * log(cutoff / A));
  }

  /******** Asymmetrical Gaussian ********/
  // normalize to [-π, π]
  double normalize(double angle) {
      while (angle > PI) angle -= 2 * PI;
      while (angle < -PI) angle += 2 * PI;
      return angle;
  }

  /******** Static individual Asymmetrical Gaussian ********/
  double Dynamic_Individual_Asymmetrical_Gaussian(double x, double y, double x0, double y0, double vx, double vy, double var, double A) {
      // define parameter
      double v = sqrt(vx * vx + vy * vy);
      double theta = atan2(vy, vx);
      double sigmaHead = fmax(0.8* v, 0.6);//fmax(1.2*v,1.0)
      // printf("sigmaHead: %f, human v: %f\n", sigmaHead, v);
      // double sigmaRear = 2.0 / 7.0;
      double sigmaRear = var / 12.0;//7.0
      double sigmaLarge = var / 10.0;//5.0
      // double sigmaSmall = 2.0 / 7.0;
      double sigmaSmall = var / 12.0;//7.0

      // compute αmain, αside
      double alphaMain = normalize(atan2(y - y0, x - x0) - theta + PI / 2);
      double alphaSide1 = normalize(alphaMain - PI / 2); // right hand principle
      // double alphaSide2 = normalize(alphaMain + PI / 2); // lefy hand principle
 
      // determin sigmaMain, sigmaSide
      double sigmaMain, sigmaSide;
      if (alphaMain > 0) {
          sigmaMain = sigmaHead;
      } else {
          sigmaMain = sigmaRear;
      }

      // if (alphaSide1 > 0 || alphaSide2 > 0) {
      if (alphaSide1 > 0) {
          sigmaSide = sigmaLarge;
      } else {
          sigmaSide = sigmaSmall;
      }

      // determin G,、Gb, Gc
      double cosTheta = cos(theta);
      double sinTheta = sin(theta);
      double Ga = (cosTheta * cosTheta) / (2 * sigmaMain * sigmaMain) + (sinTheta * sinTheta) / (2 * sigmaSide * sigmaSide);
      double Gb = sin(2 * theta) / (4 * sigmaMain * sigmaMain) - sin(2 * theta) / (4 * sigmaSide * sigmaSide);
      double Gc = (sinTheta * sinTheta) / (2 * sigmaMain * sigmaMain) + (cosTheta * cosTheta) / (2 * sigmaSide * sigmaSide);

      // compute social cost
      double result = A*exp(-1.0 * (Ga * (x - x0) * (x - x0) + 2 * Gb * (x - x0) * (y - y0) + Gc * (y - y0) * (y - y0)));

      return result;
  }         
  /******** Static individual Asymmetrical Gaussian ********/



  /******** Static Group Asymmetrical Gaussian ********/

  // double Static_Group_Asymmetrical_Gaussian(double x, double y, double x0, double y0, double vx, double vy, double var, double A,vector<vector<double>> delta_list_, double N) {
  //   // need human number N to caculate sigma_star (V)
    
  //   double sum_x = 0.0;
  //   double sum_y = 0.0;
  //   for(int i = 0; i< counts+1; i++){
  //     sum_x += delta_list_[0][i];
  //     sum_y += delta_list_[1][i];
  //   }

  //   // acquire every human's pose and calculate mean value
  //   std::vector<double> sum; //[s1,s2]
  //   double s1 = (1/(4*counts))*(sum_x);
  //   double s2 = (1/counts)*(sum_y);
  //   sum.push_back(s1);
  //   sum.push_back(s2);
    
  //   // define parameter
  //   // Eigen::Vector2d q;
  //   std::vector<double> q; //[q1,q2]
  //   double q1 = x;
  //   double q2 = y;
  //   q.push_back(q1);
  //   q.push_back(q2);
  //   // q << q1, q2;

  //   // Eigen::Vector2d p;
  //   std::vector<double> p; //[p1,p2]
  //   double p1 = x0;
  //   double p2 = y0;
  //   // p << p1, p2;
  //   p.push_back(p1);
  //   p.push_back(p2);

  //   // determin covariance / sigma_x* and sigma_y*
  //   // Eigen::Matrix2d sigma_star;
  //   //[[x^2,0],
  //   // [0,y^2]]
  //   std::vector<std::vector<double>> sigma_star;
  //   double sigma_x_star = (1/4*N)*sum[0];
  //   double sigma_y_star = (1/N)*sum[1];
  //   // static group is diagonal covariance
  //   std::vector<double> row1;
  //   row1.push_back(power(sigma_x_star,2));
  //   row1.push_back(0);
  //   sigma_star.push_back(row1);


  //   std::vector<double> row2;
  //   row2.push_back(0);
  //   row2.push_back(power(sigma_y_star,2));
  //   sigma_star.push_back(row2);

  //   // sigma_star << pow(sigma_x_star,2), 0,//[[x^2,0],[0,y^2]]
  //   //               0, pow(sigma_y_star,2);

  //   // compute social cost
  //   //double result = A*exp(-1.0 * (Ga * (x - x0) * (x - x0) + 2 * Gb * (x - x0) * (y - y0) + Gc * (y - y0) * (y - y0)));
  //   double result = exp((-1.0/2.0)*((q-p).transpose())*(sigma_star.inverse())*(q-p));

  //   return result;
  // }   
  /******** Static Group Asymmetrical Gaussian ********/

  // /******** Dynamic Group Asymmetrical Gaussian ********/
  // // define param si = φ , phi = Φ , 
  // double si_x(){

  // }
  // double si_y(){

  // }
  // double x_max(){

  // }
  // double y_max(){

  // }
  // double 

  // double Dynamic_Group_Asymmetrical_Gaussian(double x, double y, double x0, double y0, double vx, double vy, double var, double A, double N) {
  //     // need humna number N to caculate sigma_star

  //     // define parameter
  //     Eigen::Vector2d q;
  //     double q1 = x;
  //     double q2 = y;
  //     q << q1, q2;

  //     Eigen::Vector2d p;
  //     double p1 = x0;
  //     double p2 = y0;
  //     p << p1, p2;


  //     // ***group para inupt*** 
      


  //     // determin covariance / sigma_x* and sigma_y*
  //     Eigen::Matrix2d sigma_1; 
  //     Eigen::Matrix2d sigma_2;

  //     double sigma_x = si_x + max_x;
  //     double sigma_y = ;
  //     double sigma_y_prime = sigma_x + si_y;


  //     sigma_1 << pow(sigma_x,2), 0,
  //                   0, pow(sigma_y,2);

  //     sigma_2 << pow(sigma_x,2), 0,
  //                   0, pow(sigma_y_prime,2);


  //     // compute social cost
  
  //     // define weight for forward or backward of the group , total weight = 1
  //     double w_1 = 0.75;
  //     double w_2 = (1 - W_1);
  //     // forward gaussian phi_1 , backward guassian phi_2
  //     double phi_1 = w_1*exp((-1/2)*((q-p).transpose)*(sigma_1.inverse)*(q-p));
  //     double phi_2 = w_2*exp((-1/2)*((q-p).transpose)*(sigma_2.inverse)*(q-p));
  //     // sum of guassian result
  //     double result = phi_1 + phi_2;

  //     return result;
  // }  
  // /******** Dynamic Group Asymmetrical Gaussian ********/


  ros::Subscriber humans_sub_, humans_states_sub_;
  human_msgs::TrackedHumans humans_;
  human_msgs::StateArray states_;
  std::vector<HumanPoseVel> transformed_humans_;
  boost::recursive_mutex lock_;
  bool first_time_, reset;
  ros::Time last_time;
  double last_min_x_, last_min_y_, last_max_x_, last_max_y_;
  double radius_, amplitude_, covar_, cutoff_;
  // double v_cutoff_, v_amplitude_, v_covar_;

};
}  // namespace human_layers

#endif  // HUMAN_LAYERS_H
