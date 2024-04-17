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
#include <Eigen/Dense>
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

  double Guassian1D(double x, double x0, double A, double varx);

  double getRadius(double cutoff, double A, double var);

  double normalize(double angle);

  double Static_Individual_Gaussian2D(double x, double y, double x0, double y0, double A, double varx, double vary);

  double Dynamic_Individual_Asymmetrical_Gaussian(double x, double y, double x0, double y0, double vx, double vy, double var, double A);

  void cast_to_map_1p( costmap_2d::Costmap2D* costmap, vector<HumanPoseVel> group_,int min_i, int min_j, int max_i, int max_j);

  void cast_to_map_gp( costmap_2d::Costmap2D* costmap, vector<HumanPoseVel> group_,int min_i, int min_j, int max_i, int max_j);

  double Static_Group_Asymmetrical_Gaussian(double x, double y, double x0, double y0, const Eigen::Matrix2d& sigma_star_eigen_);

  double Fake_Dynamic_Individual_Asymmetrical_Gaussian(double x, double y, double x0, double y0, double vx, double vy, double var, double A);
  
  double Dynamic_Group_Asymmetrical_Gaussian(double x, double y, double x0, double y0, const Eigen::Matrix2d& sigma_1_,const Eigen::Matrix2d& sigma_2_);

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
