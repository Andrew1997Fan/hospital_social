#include <ros/ros.h>
#include <nav_msgs/OccupancyGrid.h>
#include <gazebo_msgs/ModelStates.h>
#include "geometry_msgs/Pose.h"
#include "geometry_msgs/Twist.h"
#include <vector>
#include <string>
#include <fstream>

using namespace std;
geometry_msgs::Pose robot_pose;
geometry_msgs::Twist robot_twist;
nav_msgs::OccupancyGrid::ConstPtr global_map_ptr;
int width, height;
float resolution;

// 回调函数，处理 global costmap 消息
void costmapCallback(const nav_msgs::OccupancyGrid::ConstPtr& map_msg)
{
    
    if (!map_msg) {
        ROS_WARN("Received null occupancy grid message.");
        return;
    }
    global_map_ptr = map_msg;
    width =  map_msg->info.width;
    height = map_msg->info.height;
    resolution = map_msg->info.resolution;

    // 在这里执行处理 global costmap 消息的操作
    ROS_INFO("Received global costmap message");
}

// 回调函数，处理 model state 消息
void modelStateCallback(const gazebo_msgs::ModelStates::ConstPtr& msg)
{
    
    vector<string> model_names = msg->name;
    vector<geometry_msgs::Pose> poses = msg->pose;
    vector<geometry_msgs::Twist> twists = msg->twist;
    //push_back
    // int modelCount = msg->name.size();
    // printf("modelCount = %d\n",modelCount);
	// for(int modelInd = 0; modelInd < modelCount; modelInd++)
	// {
	// 	if(model_names[modelInd] == "mars_lite")
	// 	{
	// 		robot_pose = poses[modelInd];
	// 		robot_twist = twists[modelInd];
	// 		break;
	// 	}
    //     else
    //     {
    //         ROS_INFO("Model 'mars_lite' not found in the received message.");
    //     }
	// }

    // int modelCount = 185; // total 186
    // robot_pose = poses[modelCount];
    // robot_twist = twists[modelCount];
    int modelCount = model_names.size();
    if (modelCount == 0) {
        ROS_WARN("No models found in the received message.");
        return;
    }

    // 找到模型 "mars_lite"
    bool found_model = false;
    for (int i = 0; i < modelCount; ++i) {
        if (model_names[i] == "mars_lite") {
            robot_pose = poses[i];
            robot_twist = twists[i];
            found_model = true;
            break;
        }
    }

    if (!found_model) {
        ROS_INFO("Model 'mars_lite' not found in the received message.");
        return;
    }

    if (!global_map_ptr) {
        ROS_WARN("Global costmap pointer is null.");
        return;
    }
			
    double resolution = global_map_ptr->info.resolution;
    double map_origin_x = global_map_ptr->info.origin.position.x;
    double map_origin_y = global_map_ptr->info.origin.position.y;
    int robot_x = (robot_pose.position.x - map_origin_x) / resolution;
    printf("robot_map_x = %d",robot_x);
    int robot_y = (robot_pose.position.y - map_origin_y) / resolution;
    printf("robot_map_y = %d",robot_y);

    int robot_idx = robot_y * global_map_ptr->info.width + robot_x; 
    int robot_h_cost = global_map_ptr->data[robot_idx];
    printf("robot current cost in map = %d \n",robot_h_cost); //checked

    // 在这里执行处理 model state 消息的操作
    // ROS_INFO("Received model state message");

}


int main(int argc, char** argv)
{
    // 初始化 ROS 节点
    ROS_INFO("1233123123123123");
    ros::init(argc, argv, "collide_detection");
    ros::NodeHandle nh;
    // 订阅 global costmap 话题
    ros::Subscriber costmap_sub = nh.subscribe("/move_base/global_costmap/costmap", 10, costmapCallback);
    // 订阅 model state 话题
    ros::Subscriber model_state_sub = nh.subscribe("/gazebo/model_states", 10, modelStateCallback);
    ROS_INFO("Re");
    // 循环等待回调函数
    ros::spin();

    return 0;
}
