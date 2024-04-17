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
 
#include <human_layers/static_human_layer.h>
#include <pluginlib/class_list_macros.h>
#include <angles/angles.h>
#include <tf2_eigen/tf2_eigen.h>
#include <iostream>
#include <vector>
#include <cmath>
#include <queue>
#define group_dis_cost 1.0

using namespace std;

PLUGINLIB_EXPORT_CLASS(human_layers::StaticHumanLayer, costmap_2d::Layer)

using costmap_2d::NO_INFORMATION;
using costmap_2d::LETHAL_OBSTACLE;
using costmap_2d::FREE_SPACE;

namespace human_layers
{

void StaticHumanLayer::onInitialize()
{
  HumanLayer::onInitialize();
  ros::NodeHandle nh("~/" + name_), g_nh;
  server_ = new dynamic_reconfigure::Server<HumanLayerConfig>(nh);
  f_ = boost::bind(&StaticHumanLayer::configure, this, _1, _2);
  server_->setCallback(f_);
}

void StaticHumanLayer::updateBoundsFromHumans(double* min_x, double* min_y, double* max_x, double* max_y)
{

  for(uint i=0;i<transformed_humans_.size();i++){
    auto human = transformed_humans_[i];
    double offset = 3.5;//3.5
    *min_x = std::min(*min_x, human.pose.position.x - radius_ - offset);
    *min_y = std::min(*min_y, human.pose.position.y - radius_ - offset);
    *max_x = std::max(*max_x, human.pose.position.x + radius_ + offset);
    *max_y = std::max(*max_y, human.pose.position.y + radius_ + offset);
  }
}



double cost_calculate(int a, int b, int c, int d){
  double cost;
  cost = sqrt(abs(a-c)*abs(a-c)+abs(b-d)*abs(b-d));
  return cost;
}


void StaticHumanLayer::updateCosts(costmap_2d::Costmap2D& master_grid, int min_i, int min_j, int max_i, int max_j)
{
  
  boost::recursive_mutex::scoped_lock lock(lock_);
  if (!enabled_) return;

  if (humans_.humans.size() == 0)
    return;

  costmap_2d::Costmap2D* costmap = layered_costmap_->getCostmap();
  // double res = costmap->getResolution();

  // double offset = 4.0;//4.0
  // double radius_new = radius_ + offset;

  /* add a new condition decide whether detection is individual or group*/
  uint det_size = transformed_humans_.size();

  vector<vector<double>> det_list(det_size, vector<double>(2));
  for(uint i = 0; i < transformed_humans_.size() ; i++){ //det_size
    for(int j = 0; j < 2 ; j++){
      det_list[i][j]= 0.0;
    }
  }

  // printf("show transformed_humans_.size() : %ld",transformed_humans_.size());
  for(uint i=0;i<transformed_humans_.size();i++){
      auto det_human = transformed_humans_[i];
      det_list[i][0] = det_human.pose.position.x;
      det_list[i][1] = det_human.pose.position.y;
      printf("In frame %dth human(x,y) = (%f,%f) \n",i,det_list[i][0],det_list[i][1]);
  }



  vector<vector<HumanPoseVel>> groups;

  // classify groups
  for (uint i = 0; i < transformed_humans_.size(); ++i) {
      bool found_group = false;
      for (auto& group : groups) {
          for (const auto& member : group) {
              double distance = sqrt(pow(transformed_humans_[i].pose.position.x - member.pose.position.x, 2) +
                                          pow(transformed_humans_[i].pose.position.y - member.pose.position.y, 2));
              if (distance < group_dis_cost) {
                  // 如果距离小于1，将行人加入这个群组
                  group.push_back(transformed_humans_[i]);
                  found_group = true;
                  break;
              }
          }
          if (found_group) break;
      }
      if (!found_group) {
          vector<HumanPoseVel> new_group;
          new_group.push_back(transformed_humans_[i]);
          // 如果没有找到合适的群组，则创建一个新的群组
          groups.push_back(new_group);
      }
  }

  // scan groups and call relative space
  for(auto& group : groups){
    if(group.size() > 1 ){      // groups
        for([[maybe_unused]] const auto& member : group){
          cast_to_map_gp(costmap ,group,min_i,min_j,max_i,max_j);
        }
    }
    else{ // individual
      for([[maybe_unused]] const auto& member : group){
        cast_to_map_1p(costmap ,group,min_i,min_j,max_i,max_j);
      }
    }
  }





  /*origin code start*/

  // int N = transformed_humans_.size(); 

  // vector<vector<double>> tmp_list;
  // vector<double> tmp(2); 
  // queue<double> waiting_list_q;

  // int index = 0;
  // int ptr_tmp = 0;
  // // change only one person in frame

  // if(N == 1){ // individual_gaussion
  //   cast_to_map_1p(costmap ,index,min_i,min_j,max_i,max_j);
  // }

  // /*more than one human*/
  // else{ 
      
  //     waiting_list_q.push(index); //first people
  //     for(int i = 1; i < N; i++){
  //         index++;

  //         if(cost_calculate(det_list[i-1][0],det_list[i-1][1],det_list[i][0],det_list[i][1]) < group_dis_cost){//group
  //             // waiting_list_q.push(index); //second group people

  //             if(i == N-1){ // all people in group
  //                 while(!waiting_list_q.empty()){
  //                     tmp[0] = det_list[waiting_list_q.front()][0];
  //                     tmp[1] = det_list[waiting_list_q.front()][1];
  //                     // test if it is the unstable frame 
  //                     // if(tmp[0]){
                      
  //                     // }
  //                     tmp_list.push_back(tmp);

  //                     // test if tmp_list  correct right queue
  //                     // printf("check tmp_list_current_group queue size and element : %d\n",ptr_tmp);
  //                     printf("tmp_list_current_group: x , y = %f,%f\n",tmp_list[ptr_tmp][0],tmp_list[ptr_tmp][1]);
  //                     ptr_tmp++;
  //                     waiting_list_q.pop();
  //                 }                  
  //                 printf("******** test group gaussion!!!  1  ************\n");
  //                 // for(uint z = 0; z < tmp_list.size(); z++){
  //                 //   for(int m = 0; m <2 ; m++){
  //                 //     printf("printf_current_group_tmp_list[%d][%d]:%f \n",z,m,tmp_list[z][m]);
  //                 //   }
  //                 // }
  //                 cast_to_map_gp(costmap ,tmp_list,index,min_i,min_j,max_i,max_j);
  //             }
  //             else{
  //                 waiting_list_q.push(index);
  //             }
  //         }
  //         else{
  //           if(waiting_list_q.size() != 1){//group
  //               while(!waiting_list_q.empty()){
  //                   tmp[0] = det_list[waiting_list_q.front()][0];
  //                   tmp[1] = det_list[waiting_list_q.front()][1];
  //                   tmp_list.push_back(tmp);
  //                   // printf("check tmp_list_last_group queue size and element : %d\n",ptr_tmp);

  //                   // printf("tmp_list_last_group: x , y = %f,%f\n",tmp_list[0],tmp_list[1]);
  //                   waiting_list_q.pop();
  //               }

  //               printf("******** test group gaussion!!!  2  ************\n");

  //               cast_to_map_gp(costmap ,tmp_list,index,min_i,min_j,max_i,max_j);

  //           }
  //           else{
  //               while(!waiting_list_q.empty()){
  //                   tmp[0] = det_list[waiting_list_q.front()][0];
  //                   tmp[1] = det_list[waiting_list_q.front()][1];
  //                   tmp_list.push_back(tmp);
  //                   waiting_list_q.pop();
  //                 }
  //               printf("******** test individual gaussion!!!  1  ************\n");
  //               cast_to_map_1p(costmap ,index,min_i,min_j,max_i,max_j);
  //           }
  //           waiting_list_q.push(index);

  //           if(i == N-1){// last one 
  //             while(!waiting_list_q.empty()){
  //                 tmp[0] = det_list[waiting_list_q.front()][0];
  //                 tmp[1] = det_list[waiting_list_q.front()][1];
  //                 tmp_list.push_back(tmp);
  //                 waiting_list_q.pop();
  //             }
  //             printf("******** test individual gaussion!!!   2  ************\n");
  //             cast_to_map_1p(costmap ,index,min_i,min_j,max_i,max_j);
  //           }

  //         }  

  //     }
  // }
  /*origin code start*/
}


void StaticHumanLayer::configure(HumanLayerConfig &config, uint32_t level)
{
  amplitude_ = config.amplitude;
  radius_ = config.radius;
  enabled_ = config.enabled;
}
};  // namespace human_layers
