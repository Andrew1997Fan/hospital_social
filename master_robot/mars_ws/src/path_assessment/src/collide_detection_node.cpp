#include <ros/ros.h>
#include <nav_msgs/OccupancyGrid.h>
#include <gazebo_msgs/ModelStates.h>
#include <pedsim_msgs/AgentStates.h>
#include "geometry_msgs/Pose.h"
#include "geometry_msgs/Twist.h"
#include <vector>
#include <string>
#include <fstream>
#include <math.h>
#include <stdio.h>

using namespace std;
geometry_msgs::Pose robot_pose;
geometry_msgs::Twist robot_twist;
nav_msgs::OccupancyGrid::ConstPtr global_map_ptr;
int width, height;
float resolution;



bool compareByDistance(const geometry_msgs::Pose& pose1, const geometry_msgs::Pose& pose2) {
    // 计算点到原点的距离
    float distance1 = sqrt(pose1.position.x * pose1.position.x + pose1.position.y * pose1.position.y);
    float distance2 = sqrt(pose2.position.x * pose2.position.x + pose2.position.y * pose2.position.y);
    
    // 比较两个点到原点的距离
    return distance1 < distance2;
}

void writeToCSV(const char* filename, double robotPosX, double robotPosY, const std::vector<float>& distances_below_threshold, const std::vector<float>& distances_between_threshold_and_upper_bound) {
    FILE* outputFile = fopen(filename, "a"); // 以附加模式打開檔案
    if (!outputFile) {
        ROS_ERROR("Unable to open CSV file for writing.");
        return;
    }

    // 將機器人的位置寫入 CSV 檔案
    fprintf(outputFile, "%f,%f,", robotPosX, robotPosY);

    // 將每個行人的距離寫入 CSV 檔案
    for (size_t i = 0; i < distances_below_threshold.size(); ++i) {
        fprintf(outputFile, "%f,", distances_below_threshold[i]);
    }

    // 將 distances_between_threshold_and_upper_bound 向量中的值寫入 CSV 檔案
    for (size_t i = 0; i < distances_between_threshold_and_upper_bound.size(); ++i) {
        fprintf(outputFile, "%f,", distances_between_threshold_and_upper_bound[i]);
    }

    fprintf(outputFile, "\n"); // 写入行结束符
    fclose(outputFile); // 关闭文件
    ROS_INFO("Data has been written to %s", filename);
}

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
    // printf("robot_map_x = %d",robot_x);
    int robot_y = (robot_pose.position.y - map_origin_y) / resolution;
    // printf("robot_map_y = %d",robot_y);

    int robot_idx = robot_y * global_map_ptr->info.width + robot_x; 
    int robot_h_cost = global_map_ptr->data[robot_idx];
    // printf("robot current cost in map = %d \n",robot_h_cost); //checked


    // 在这里执行处理 model state 消息的操作
    // ROS_INFO("Received model state message");



}

void humanStateCallback(const pedsim_msgs::AgentStates::ConstPtr& human_msg){
    vector<geometry_msgs::Pose> poses;
    vector<geometry_msgs::Twist> twists;
    if (!human_msg) {
        ROS_WARN("Received null human_state message.");
        return;
    }
    // Process agent states
    int agent_size = (human_msg->agent_states).size();
    for (int i=0;i<agent_size;i++)
    {

        // Access each agent state
        int id = human_msg->agent_states[i].id;
        geometry_msgs::Pose pose = human_msg->agent_states[i].pose;
        geometry_msgs::Twist twist = human_msg->agent_states[i].twist;
        poses.push_back(pose);
        twists.push_back(twist);
    }
    // 遍历每个行人的位置信息
    // for (const auto& pose : poses) {
    //     double x = pose.position.x; // 行人的x座标
    //     double y = pose.position.y; // 行人的y座标
    //     ROS_INFO("Human position: (%f, %f)", x, y);
    // }
    // 对poses向量中的行人按照x轴位置进行排序

    vector<geometry_msgs::Pose> sortedPoses; // 复制一份以避免修改原始数据
    geometry_msgs::Pose pose_diff;
    for(int j = 0; j < agent_size; j++){
        pose_diff.position.x = abs(robot_pose.position.x - poses[j].position.x);
        pose_diff.position.y = abs(robot_pose.position.y - poses[j].position.y);
        sortedPoses.push_back(pose_diff);
    }
    sort(sortedPoses.begin(), sortedPoses.end(), compareByDistance);

    std::vector<float> distances_below_threshold;
    std::vector<float> distances_between_threshold_and_upper_bound;

    float threshold = 0.5;
    float upper_bound = 1.0;

    for (size_t i = 0; i < sortedPoses.size() - 1; ++i) {
        for (size_t j = i + 1; j < sortedPoses.size(); ++j) {
            // 计算两点之间的绝对距离
            float distance = sqrt(pow(sortedPoses[j].position.x - sortedPoses[i].position.x, 2) +
                                  pow(sortedPoses[j].position.y - sortedPoses[i].position.y, 2));
            // 根据条件将距离添加到相应列表中
            if (distance < threshold) {
                distances_below_threshold.push_back(distance);
            } else if (distance >= threshold && distance < upper_bound) {
                distances_between_threshold_and_upper_bound.push_back(distance);
            }
        }
    }
    writeToCSV("/home/developer/master_ws/master_robot/mars_ws/src/path_assessment/src/data/robot_positions.csv", robot_pose.position.x, robot_pose.position.y, distances_below_threshold, distances_between_threshold_and_upper_bound);


    // ofstream outputFile("robot_positions.csv", ios::app);
    // if (outputFile.is_open()) {
    //     // 将机器人的位置写入 CSV 文件
    //     outputFile << robot_pose.position.x << "," << robot_pose.position.y << ",";
        
    //     // 将每个行人的距离写入 CSV 文件
    //     for (const auto& distance : distances_below_threshold) {
    //         outputFile << distance << ",";
    //     }

    //     // 将 distances_between_threshold_and_upper_bound 向量中的值写入 CSV 文件
    //     for (const auto& distance : distances_between_threshold_and_upper_bound) {
    //         outputFile << distance << ",";
    //     }
    //     outputFile << endl; // 写入行结束符
    //     outputFile.close(); // 关闭文件
    //     ROS_INFO("Data has been written to robot_positions.csv");
    // } else {
    //     ROS_ERROR("Unable to open CSV file for writing.");
    // }
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
    // 订阅 pedsim human 话题
    ros::Subscriber human_state_sub = nh.subscribe("/pedsim_simulator/simulated_agents" , 10, humanStateCallback);
    ROS_INFO("Re");
    // 循环等待回调函数
    ros::spin();

    return 0;
}
