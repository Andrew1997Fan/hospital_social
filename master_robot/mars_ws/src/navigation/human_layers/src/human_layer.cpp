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
 
#include <human_layers/human_layer.h>
#include <human_layers/static_human_layer.h>
#include <angles/angles.h>
#include <pluginlib/class_list_macros.h>

#define DEFAULT_HUMAN_PART human_msgs::TrackedSegmentType::TORSO
#define TRACKED_HUMAN_SUB "/tracked_humans"
#define HUMANS_STATES_SUB "/move_base/HATebLocalPlannerROS/humans_states"

using costmap_2d::NO_INFORMATION;
using costmap_2d::LETHAL_OBSTACLE;
using costmap_2d::FREE_SPACE;

namespace human_layers
{
void HumanLayer::onInitialize()
{
  ros::NodeHandle nh("~/" + name_), g_nh;
  humans_sub_ = nh.subscribe(TRACKED_HUMAN_SUB, 1, &HumanLayer::humansCB, this);
  humans_states_sub_ = nh.subscribe(HUMANS_STATES_SUB, 1, &HumanLayer::statesCB, this);

  current_ = true;
  first_time_ = true;
}

void HumanLayer::humansCB(const human_msgs::TrackedHumans& humans)
{
  boost::recursive_mutex::scoped_lock lock(lock_);
  humans_ = humans;
}

void HumanLayer::statesCB(const human_msgs::StateArray& states){
  boost::recursive_mutex::scoped_lock lock(lock_);
  states_ = states;
  reset = false;
  last_time = ros::Time::now();
}


void HumanLayer::updateBounds(double origin_x, double origin_y, double origin_z, double* min_x, double* min_y,
                               double* max_x, double* max_y)
{
  boost::recursive_mutex::scoped_lock lock(lock_);

  std::string global_frame = layered_costmap_->getGlobalFrameID();
  transformed_humans_.clear();

  if((ros::Time::now()-last_time).toSec() > 1.0){
    reset = true;
  }

  for(auto &human : humans_.humans){
    for(auto &segment : human.segments){
      if(0){
      // if(segment.type == DEFAULT_HUMAN_PART && !reset){
        if((abs(segment.twist.twist.linear.x)+abs(segment.twist.twist.linear.y)+abs(segment.twist.twist.angular.z)) < 0.0001 && !states_.states.empty()){
          ROS_INFO("human state %d\n", (int)states_.states[human.track_id-1]);
          if((int)states_.states[human.track_id-1]==0){
            HumanPoseVel human_pose_vel;
            human_pose_vel.header.frame_id = humans_.header.frame_id;
            human_pose_vel.header.stamp = humans_.header.stamp;
            geometry_msgs::PoseStamped before_pose, after_pose;

            try
            {
              before_pose.pose = segment.pose.pose;
              before_pose.header.frame_id = humans_.header.frame_id;
              before_pose.header.stamp = humans_.header.stamp;
              tf_->transform(before_pose,after_pose,global_frame,ros::Duration(0.5));
              human_pose_vel.pose = after_pose.pose;

              before_pose.pose.position.x += segment.twist.twist.linear.x;
              before_pose.pose.position.y += segment.twist.twist.linear.y;
              auto hb_yaw = tf2::getYaw(before_pose.pose.orientation);
              tf2::Quaternion quat;
              quat.setEuler(segment.twist.twist.angular.z + hb_yaw,0.0,0.0);
              tf2::convert(before_pose.pose.orientation, quat);
              tf_->transform(before_pose,after_pose,global_frame, ros::Duration(0.5));
              // human_pose_vel.velocity.linear.x = after_pose.pose.position.x - human_pose_vel.pose.position.x;
              // human_pose_vel.velocity.linear.y = after_pose.pose.position.y - human_pose_vel.pose.position.y;
              human_pose_vel.velocity.linear.x = segment.twist.twist.linear.x;
              human_pose_vel.velocity.linear.y = segment.twist.twist.linear.y;
              human_pose_vel.velocity.angular.z = angles::shortest_angular_distance(tf2::getYaw(after_pose.pose.orientation),tf2::getYaw(human_pose_vel.pose.orientation));

              transformed_humans_.push_back(human_pose_vel);
            }
            catch (tf2::LookupException& ex)
            {
              ROS_ERROR("No Transform available Error: %s\n", ex.what());
              continue;
            }
            catch (tf2::ConnectivityException& ex)
            {
              ROS_ERROR("Connectivity Error: %s\n", ex.what());
              continue;
            }
            catch (tf2::ExtrapolationException& ex)
            {
              ROS_ERROR("Extrapolation Error: %s\n", ex.what());
              continue;
            }
          }
        }
      }
      // else if(reset){
      if(1){
        HumanPoseVel human_pose_vel;
        human_pose_vel.header.frame_id = humans_.header.frame_id;
        human_pose_vel.header.stamp = humans_.header.stamp;
        geometry_msgs::PoseStamped before_pose, after_pose;

        try
        {
          before_pose.pose = segment.pose.pose;
          before_pose.header.frame_id = humans_.header.frame_id;
          before_pose.header.stamp = humans_.header.stamp;
          tf_->transform(before_pose,after_pose,global_frame,ros::Duration(0.5));
          human_pose_vel.pose = after_pose.pose;

          before_pose.pose.position.x += segment.twist.twist.linear.x;
          before_pose.pose.position.y += segment.twist.twist.linear.y;
          auto hb_yaw = tf2::getYaw(before_pose.pose.orientation);
          tf2::Quaternion quat;
          quat.setEuler(segment.twist.twist.angular.z + hb_yaw,0.0,0.0);
          tf2::convert(before_pose.pose.orientation, quat);
          tf_->transform(before_pose,after_pose,global_frame, ros::Duration(0.5));
          human_pose_vel.velocity.linear.x = after_pose.pose.position.x - human_pose_vel.pose.position.x;
          human_pose_vel.velocity.linear.y = after_pose.pose.position.y - human_pose_vel.pose.position.y;
          human_pose_vel.velocity.angular.z = angles::shortest_angular_distance(tf2::getYaw(after_pose.pose.orientation),tf2::getYaw(human_pose_vel.pose.orientation));

          transformed_humans_.push_back(human_pose_vel);
        }
        catch (tf2::LookupException& ex)
        {
          ROS_ERROR("No Transform available Error: %s\n", ex.what());
          continue;
        }
        catch (tf2::ConnectivityException& ex)
        {
          ROS_ERROR("Connectivity Error: %s\n", ex.what());
          continue;
        }
        catch (tf2::ExtrapolationException& ex)
        {
          ROS_ERROR("Extrapolation Error: %s\n", ex.what());
          continue;
        }
      }
    }
  }
  updateBoundsFromHumans(min_x, min_y, max_x, max_y);
  if (first_time_)
  {
    last_min_x_ = *min_x;
    last_min_y_ = *min_y;
    last_max_x_ = *max_x;
    last_max_y_ = *max_y;
    first_time_ = false;
  }
  else
  {
    double a = *min_x, b = *min_y, c = *max_x, d = *max_y;
    *min_x = std::min(last_min_x_, *min_x);
    *min_y = std::min(last_min_y_, *min_y);
    *max_x = std::max(last_max_x_, *max_x);
    *max_y = std::max(last_max_y_, *max_y);
    last_min_x_ = a;
    last_min_y_ = b;
    last_max_x_ = c;
    last_max_y_ = d;
  }
}

double HumanLayer::Guassian1D(double x, double x0, double A, double varx){
    double dx = x-x0;
    return A*exp(-pow(dx,2.0)/(2.0*varx));
  }

double HumanLayer::Static_Individual_Gaussian2D(double x, double y, double x0, double y0, double A, double varx, double vary)
  {
    double dx = x - x0, dy = y - y0;
    double d = sqrt(dx * dx + dy * dy);
    double theta = atan2(dy, dx);
    double X = d*cos(theta), Y = d*sin(theta);
    double scale = 10;//3
    return (A/2)/std::max(d,1.0) * Guassian1D(X,0.0,1.0,varx/scale) * Guassian1D(Y,0.0,1.0,vary/scale);
  }

double HumanLayer::getRadius(double cutoff, double A, double var)
  {
    return sqrt(-2 * var * log(cutoff / A));
  }

double HumanLayer::normalize(double angle) {
    while (angle > PI) angle -= 2 * PI;
    while (angle < -PI) angle += 2 * PI;
    return angle;
}

double HumanLayer::Dynamic_Individual_Asymmetrical_Gaussian(double x, double y, double x0, double y0, double vx, double vy, double var, double A) {
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
//test
double HumanLayer::Fake_Dynamic_Individual_Asymmetrical_Gaussian(double x, double y, double x0, double y0, double vx, double vy, double var, double A) {
    // define parameter
    A = 1.0;
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

double HumanLayer::Static_Group_Asymmetrical_Gaussian(double x, double y, double x0, double y0, const Eigen::Matrix2d& sigma_star_eigen_) {
    double amp_s = 8.5;
    // define parameter
    Eigen::Vector2d q_eigen;
    q_eigen << x,y;
    Eigen::Vector2d p_eigen;
    p_eigen << x0,y0;
    double result = amp_s*exp((-1.0/2.0)*((q_eigen-p_eigen).transpose())*(sigma_star_eigen_.inverse())*(q_eigen-p_eigen));
 
    return result;
  }  


double HumanLayer::Dynamic_Group_Asymmetrical_Gaussian(double x, double y, double x0, double y0, const Eigen::Matrix2d& sigma_1_,const Eigen::Matrix2d& sigma_2_) {
      double amp_d = 10.0;
      Eigen::Vector2d q_eigen;
      q_eigen << x,y;

      Eigen::Vector2d p_eigen;
      p_eigen << x0,y0;
      // define weight for forward or backward of the group , total weight = 1
      double w_1 = 0.75;
      double w_2 = (1 - w_1);
      // forward gaussian phi_1 , backward guassian phi_2
      double phi_1 = w_1*exp((-1.0/2.0)*((q_eigen-p_eigen).transpose())*(sigma_1_.inverse())*(q_eigen-p_eigen));
      double phi_2 = w_2*exp((-1.0/2.0)*((q_eigen-p_eigen).transpose())*(sigma_2_.inverse())*(q_eigen-p_eigen));
      double result = amp_d*(phi_1 + phi_2);

      return result;
  }  

void HumanLayer::cast_to_map_1p( costmap_2d::Costmap2D* costmap, vector<HumanPoseVel> group_,int min_i, int min_j, int max_i, int max_j){
  /*-------------------start cost_map generate----------------*/
  //append drawing gaussion function

  double res = costmap->getResolution();
  double offset = 4.0;//4.0
  double radius_new = radius_ + offset;

  auto human = group_[0];
  // auto human = transformed_humans_[index_];
  unsigned int width = std::max(1, static_cast<int>((2*radius_new) / res)),
                height = std::max(1, static_cast<int>((2*radius_new) / res));
    
  //   double cx = human.pose.position.x, cy = human.pose.position.y;
  // double vx = human.velocity.linear.x, vy = human.velocity.linear.y;
  double cx = human.pose.position.x, cy = human.pose.position.y;
  double vx = human.velocity.linear.x, vy = human.velocity.linear.y;
  double ox = cx - radius_new, oy = cy - radius_new;


  int mx, my;
  costmap->worldToMapNoBounds(ox, oy, mx, my);

  int start_x = 0, start_y = 0, end_x = width, end_y = height;
  if (mx < 0)
    start_x = -mx;
  else if (mx + width > costmap->getSizeInCellsX())
    end_x = std::max(0, static_cast<int>(costmap->getSizeInCellsX()) - mx);

  if (static_cast<int>(start_x + mx) < min_i)
    start_x = min_i - mx;
  if (static_cast<int>(end_x + mx) > max_i)
    end_x = max_i - mx;

  if (my < 0)
    start_y = -my;
  else if (my + height > costmap->getSizeInCellsY())
    end_y = std::max(0, static_cast<int>(costmap->getSizeInCellsY()) - my);

  if (static_cast<int>(start_y + my) < min_j)
    start_y = min_j - my;
  if (static_cast<int>(end_y + my) > max_j)
    end_y = max_j - my;

  double bx = ox + res / 2,
          by = oy + res / 2;

  double var = radius_;
  for (int i = start_x; i < end_x; i++)
  {
    for (int j = start_y; j < end_y; j++)
    {
      unsigned char old_cost = costmap->getCost(i + mx, j + my);
      if (old_cost == costmap_2d::NO_INFORMATION)
        continue;

      double x = bx + i * res, y = by + j * res;
      double v = sqrt(vx * vx + vy * vy);
      double val;
      
      if(v > 0.05 ){ // ok 
        // printf("******** Dynamic_Individual **********\n");
        val = Dynamic_Individual_Asymmetrical_Gaussian(x, y, cx, cy, vx, vy, var, amplitude_);
      }
      /*no moving human*/
      else{
        // printf("******** Static_Individual **********\n");
        val = Static_Individual_Gaussian2D(x, y, cx, cy, amplitude_, var, var);
      }

      unsigned char cvalue = (unsigned char) val;
      if(val > 1){
        printf("%f \n",val);
      }
      

      // printf("cost_x_i : %d, cost_y_i : %d\n",i + mx, j + my);

      costmap->setCost(i + mx, j + my, std::max(cvalue, old_cost));
    }
  }
  printf("*****************update to individual_cost_map****************\n");


}


void HumanLayer::cast_to_map_gp( costmap_2d::Costmap2D* costmap,vector<HumanPoseVel> group_,int min_i, int min_j, int max_i, int max_j){
  double res = costmap->getResolution();
  double offset = 4.0;//4.0
  double radius_new = radius_ + offset;

  double cx = 0.0, cy=0.0;
  double count = 0.0;
  for(const auto& member : group_){
    cx += member.pose.position.x;
    cy += member.pose.position.y;
    count++ ;
  }
  if (count > 0) {
    cx /= count;
    cy /= count;
  } else {
    std::cerr << "Error: No member in the group." << std::endl;
  }
  printf("cx = %f\n",cx);
  printf("cy = %f\n",cy);
  unsigned int width = std::max(1, static_cast<int>((2*radius_new) / res)),
                height = std::max(1, static_cast<int>((2*radius_new) / res));
      

  /* group guassian */
    /*----------------static group ----------------*/
    int amp = 3, B = 2;
    double dif_x_total= 0.0, dif_y_total=0.0;
    int counting = 0;
    const int group_size = group_.size();
    // 计算从头到尾的绝对距离
    for (int i = 0; i < group_size - 1; i++) {
        dif_x_total += abs(group_[i + 1].pose.position.x - group_[i].pose.position.x);
        dif_y_total += abs(group_[i + 1].pose.position.y - group_[i].pose.position.y);
        counting++;
    }
    // 计算首尾之间的绝对距离
    if (group_size > 1) {
        dif_x_total += abs(group_[0].pose.position.x - group_[group_size - 1].pose.position.x);
        dif_y_total += abs(group_[0].pose.position.y - group_[group_size - 1].pose.position.y);
        counting++;
    }
    int N = group_.size();

    vector<double> sum; //[s1,s2]
    double s1 = B*amp*(1.0/(4*N))*(dif_x_total);
    printf("s1 = %f\n",s1);
    double s2 = B*(1.0/N)*(dif_y_total);
    sum.push_back(s1);
    sum.push_back(s2);
    Eigen::Matrix2d sigma_star_eigen;
    sigma_star_eigen << sum[0]*sum[0], 0,
                          0, sum[1]*sum[1];

     /*----------------static group ----------------*/
    /*----------------dynamic group ----------------*/

    double mean_x = 0.0, mean_y = 0.0;
    for (const auto& member : group_) {
        mean_x += member.pose.position.x;
        mean_y += member.pose.position.y;
    }
    mean_x /= group_.size();
    mean_y /= group_.size();

    // 计算中间点
    double l_x = 0.5 * (group_.front().pose.position.x + group_.back().pose.position.x);
    double l_y = 0.5 * (group_.front().pose.position.y + group_.back().pose.position.y);

    // 计算大小
    double si_x = abs(mean_x - l_x);
    double si_y = abs(mean_y - l_y);

    // 计算范围
    double y_b = group_.front().pose.position.y;
    double y_f = group_.front().pose.position.y;
    for (const auto& member : group_) {
        if (member.pose.position.y < y_f) {
            y_f = member.pose.position.y;
        }
        if (member.pose.position.y > y_b) {
            y_b = member.pose.position.y;
        }
    }
    Eigen::Matrix2d sigma_1; 
    Eigen::Matrix2d sigma_2;

    // double sigma_x = si_x + max(det_list_[N-1][0]-mean_x,mean_x-det_list_[0][0]);
    double sigma_x = amp*B*(si_x + max(group_.back().pose.position.x-mean_x, mean_x-group_.front().pose.position.x));

    double sigma_y = amp*(mean_x - y_b);
    double sigma_y_prime = amp*(sigma_x + si_y + max(y_b - mean_y,mean_y - y_f));
    printf("sigma_x : %f \n",sigma_x );
    printf("sigma_y : %f \n",sigma_y );
    printf("sigma_y_prime : %f \n",sigma_y_prime );

    sigma_1 << sigma_x*sigma_x, 0,
                  0, sigma_y*sigma_y;

    sigma_2 << sigma_x*sigma_x, 0,
                  0, sigma_y_prime*sigma_y_prime;
    /*----------------dynamic group ----------------*/

  /* group gaussian */

  double vx = group_[0].velocity.linear.x, vy = group_[0].velocity.linear.y; //assume group move in same speed so choose one of them represent
  double ox = cx - radius_new, oy = cy - radius_new;

  int mx, my;
  costmap->worldToMapNoBounds(ox, oy, mx, my);

  int start_x = 0, start_y = 0, end_x = width, end_y = height;
  if (mx < 0)
    start_x = -mx;
  else if (mx + width > costmap->getSizeInCellsX())
    end_x = std::max(0, static_cast<int>(costmap->getSizeInCellsX()) - mx);

  if (static_cast<int>(start_x + mx) < min_i)
    start_x = min_i - mx;
  if (static_cast<int>(end_x + mx) > max_i)
    end_x = max_i - mx;

  if (my < 0)
    start_y = -my;
  else if (my + height > costmap->getSizeInCellsY())
    end_y = std::max(0, static_cast<int>(costmap->getSizeInCellsY()) - my);

  if (static_cast<int>(start_y + my) < min_j)
    start_y = min_j - my;
  if (static_cast<int>(end_y + my) > max_j)
    end_y = max_j - my;
  // double var = radius_;
  double bx = ox + res / 2,
        by = oy + res / 2;

  for (int i = start_x; i < end_x; i++)
  {
    for (int j = start_y; j < end_y; j++)
    {
      // printf("loop[%d]:k=%d,p=%d\n",k*p,k,p);
      unsigned char old_cost = costmap->getCost(i + mx, j + my);
      if (old_cost == costmap_2d::NO_INFORMATION)
        continue;

      double x = bx + i * res, y = by + j * res;
      double v = sqrt(vx * vx + vy * vy);
      double val;
      if(v > 0.05 ){ // ok 
        val = Dynamic_Group_Asymmetrical_Gaussian(x, y, cx, cy, sigma_1,sigma_2);
        
      }
      else{
        val = Static_Group_Asymmetrical_Gaussian(x, y, cx, cy, sigma_star_eigen);

      }

      if(val > 1.0){
        printf("%f \n",val);
      }
      unsigned char cvalue = val;//(unsigned char) val*100;
      // printf("cost_x_g : %d, cost_y_g : %d\n",i + mx, j + my);

      costmap->setCost(i + mx, j + my, std::max(cvalue, old_cost));

    }
  }
  printf("*****************update to group_cost_map****************\n");
}


};  // namespace human_layers
