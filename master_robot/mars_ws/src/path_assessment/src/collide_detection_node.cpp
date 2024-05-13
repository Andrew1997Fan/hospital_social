#include <ros/ros.h>
#include <nav_msgs/OccupancyGrid.h>
#include <gazebo_msgs/ModelStates.h>
#include <pedsim_msgs/AgentStates.h>
#include "geometry_msgs/PoseWithCovarianceStamped.h"
#include "visualization_msgs/MarkerArray.h"
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

void writeToCSV_robot(const char* filename, double robotPosX, double robotPosY) {
    FILE* outputFile = fopen(filename, "a"); // 以附加模式打開檔案
    if (!outputFile) {
        ROS_ERROR("Unable to open CSV file for writing.");
        return;
    }

    // 將機器人的位置寫入 CSV 檔案
    fprintf(outputFile, "%f,%f,", robotPosX, robotPosY);

    fprintf(outputFile, "\n"); // 写入行结束符
    fclose(outputFile); // 关闭文件
    ROS_INFO("Data has been written to %s", filename);
}
void writeToCSV_human_dis(const char* filename, double robotPosX, double robotPosY, int human_id) {
    FILE* outputFile = fopen(filename, "a"); // 以附加模式打開檔案
    if (!outputFile) {
        ROS_ERROR("Unable to open CSV file for writing.");
        return;
    }

    // 將機器人的位置及 ID 寫入 CSV 檔案
    fprintf(outputFile, "%f,%f,%d,\n", robotPosX, robotPosY, human_id);

    fclose(outputFile); // 关闭文件
    ROS_INFO("Data has been written to %s", filename);
}


// const std::vector<float>& distances_between_threshold_and_upper_bound
void writeToCSV_human(const char* filename, const std::vector<float>& distances_below_threshold) {
    FILE* outputFile = fopen(filename, "a"); // 以附加模式打開檔案
    if (!outputFile) {
        ROS_ERROR("Unable to open CSV file for writing.");
        return;
    }

    // 將每個行人的距離寫入 CSV 檔案
    for (size_t i = 0; i < distances_below_threshold.size(); ++i) {
        fprintf(outputFile, "%f,", distances_below_threshold[i]);
    }

    fprintf(outputFile, "\n"); // 写入行结束符
    fclose(outputFile); // 关闭文件
    ROS_INFO("Data has been written to %s", filename);
}

struct HumanPoseVel {
    int id; // 人的編號
    geometry_msgs::Pose pose;
    geometry_msgs::Twist twist;
};

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
    // ROS_INFO("Received global costmap message");
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
        if (model_names[i] =="mars_lite" ) { //"PatientWheelChair_1"
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
    writeToCSV_robot("/home/developer/master_ws/master_robot/mars_ws/src/path_assessment/src/data/social_astar_full_scene_test1.csv", robot_pose.position.x, robot_pose.position.y);



    //  publish static human info

    /* static human in corridor */
    // 3 human[x,y] : [5.5,-20.0][5.5,-5.0][4.0,-12.0]
    // 三个静态人体的坐标
    // vector<vector<float>> static_human_poses = {{5.0, -2.0}, {5.0, -6.0}};
    // vector<vector<float>> static_human_poses = {{0.0, 11.0}}; //wheelchair
    // 2个静态group的center坐标
    // vector<vector<float>> static_human_poses = {{2.5,10.75}, {-2.0, 11.25}};
    // geometry_msgs::Pose mv_human_pose;
    // geometry_msgs::Twist mv_human_twist;
    // 找到模型 "moving individual" = Scrubs_2
    // bool found_model_mv_person = false;
    // for (int i = 0; i < modelCount; ++i) {
    //     if (model_names[i] =="Scrubs_2" ) { //"PatientWheelChair_1" "mars_lite" "scrubs_2"
    //         mv_human_pose = poses[i];//robot_pose = poses[i];
    //         mv_human_twist = twists[i];//robot_twist = twists[i];
    //         found_model_mv_person = true;
    //         break;
    //     }
    // }
    /* static group adding human info*/
    // vector<geometry_msgs::Pose> poses_;
    // // // 将静态人体坐标添加到poses中
    // for (const auto& static_pose : static_human_poses) {
    //     geometry_msgs::Pose pose_tmp;
    //     pose_tmp.position.x = static_pose[0]; //static_pose[0]
    //     pose_tmp.position.y = static_pose[1]; //static_pose[1]
    //     pose_tmp.position.z = 0.0; // 如果Z坐标也存在，请将其设置为适当的值
    //     poses_.push_back(pose_tmp);
    // }
    // // /* static human in corridor */
    // // // printf("robot_x = %f, robot_y = %f\n",robot_pose.position.x,robot_pose.position.y);

    // vector<geometry_msgs::Pose> sortedPoses; // 复制一份以避免修改原始数据
    // geometry_msgs::Pose pose_diff;
    // for(int j = 0; j < 1; j++){ //j<agent_size (when human size not declare)
    //     pose_diff.position.x = abs(robot_pose.position.x - poses_[j].position.x);
    //     pose_diff.position.y = abs(robot_pose.position.y - poses_[j].position.y);
    //     sortedPoses.push_back(pose_diff);
    // }
    // sort(sortedPoses.begin(), sortedPoses.end(), compareByDistance);
    // /* static group adding human info*/

    
    // vector<float> distances_below_threshold;

    // float threshold = 2;
    // /*sorted poses only needed in group*/
    // float distance = sortedPoses[0].position.x + sortedPoses[0].position.y; //abs(delta_x)+abs(delta_y)
    // // float distance = mv_human_pose.position.x + mv_human_pose.position.y; //abs(delta_x)+abs(delta_y)

    // if(distance >= threshold){
    //     distances_below_threshold.push_back(2);
    // }
    // else if(distance < threshold){
    //     distances_below_threshold.push_back(distance);
    // }


    // // // writeToCSV_human("/home/developer/master_ws/master_robot/mars_ws/src/path_assessment/src/data/robot_positions_1.csv",distances_below_threshold, distances_between_threshold_and_upper_bound);
    // writeToCSV_human("/home/developer/master_ws/master_robot/mars_ws/src/path_assessment/src/data/larger_social_human_collide_index_astar_static_wheelchair_test1.csv",distances_below_threshold);

}

void humanStateCallback(const pedsim_msgs::AgentStates::ConstPtr& human_msg){
    vector<geometry_msgs::Pose> poses;
    vector<geometry_msgs::Twist> twists;
    if (!human_msg) {
        ROS_WARN("Received null human_state message.");
        return;
    }
    // Process agent states
    /* undefined human size*/

    /*  ----------------this callback funtion depends on pedsim -----------------  */
    /*  ------------------------if want to use gazebo/model_staet need to write new callback and recognition each class-------------------------  */

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


    
    /*  whole scenario exp  */
    // store full human info
    vector<geometry_msgs::Pose> poses_;

    vector<vector<float>> static_human_poses = {{-2, 9}, {2.5, 7.5}}; // wheel chair, static group, static individual
        // // 将静态人体坐标添加到poses中
    for (const auto& static_pose : static_human_poses) {
        geometry_msgs::Pose pose;
        pose.position.x = static_pose[0];
        pose.position.y = static_pose[1];
        pose.position.z = 0.0; // 如果Z坐标也存在，请将其设置为适当的值
        poses_.push_back(pose);
    }

    // dynamic group in full scene
    vector<geometry_msgs::Pose> sortedPoses; // 复制一份以避免修改原始数据    
    geometry_msgs::Pose pose_diff;
    geometry_msgs::Pose pose_mid_1;
    geometry_msgs::Pose pose_indiv_1;

    pose_indiv_1.position.x = poses[0].position.x;
    pose_indiv_1.position.x = poses[0].position.y;
    poses_.push_back(pose_indiv_1);

    pose_mid_1.position.x = (poses[1].position.x + poses[2].position.x + poses[3].position.x)/3;
    pose_mid_1.position.y = (poses[1].position.y + poses[2].position.y + poses[3].position.y)/3;
    poses_.push_back(pose_mid_1);

    for(int j = 0; j< 4; j++){ //j<agent_size (when human size not declare)
        pose_diff.position.x = abs(robot_pose.position.x - poses_[j].position.x);
        pose_diff.position.y = abs(robot_pose.position.y - poses_[j].position.y);
        sortedPoses.push_back(pose_diff);
    }




    sort(sortedPoses.begin(), sortedPoses.end(), compareByDistance); //the first state will be the nearest human!! no need to identy every people
    /*  whole scenario exp  */


    /* static human in corridor */
    // 3 human[x,y] : [5.5,-20.0][5.5,-5.0][4.0,-12.0]
    // 三个静态人体的坐标
    // vector<vector<float>> static_human_poses = {{5.5, -20.0}, {5.5, -5.0}, {4.0, -12.0}};

    // for (const auto& static_pose : static_human_poses) {
    //     geometry_msgs::Pose pose;
    //     pose.position.x = static_pose[0];
    //     pose.position.y = static_pose[1];
    //     pose.position.z = 0.0; // 如果Z坐标也存在，请将其设置为适当的值
    //     poses.push_back(pose);
    // }

    /* static human in corridor */

    // 遍历每个行人的位置信息
    // for (const auto& pose : poses) {
    //     double x = pose.position.x; // 行人的x座标
    //     double y = pose.position.y; // 行人的y座标
    //     ROS_INFO("Human position: (%f, %f)", x, y);
    // }
    // 对poses向量中的行人按照x轴位置进行排序

    // vector<geometry_msgs::Pose> sortedPoses; // 复制一份以避免修改原始数据
    // geometry_msgs::Pose pose_diff;
    // for(int j = 0; j< agent_size; j++){ //j<agent_size (when human size not declare)
    //     pose_diff.position.x = abs(robot_pose.position.x - poses[j].position.x);
    //     pose_diff.position.y = abs(robot_pose.position.y - poses[j].position.y);
    //     sortedPoses.push_back(pose_diff);
    // }
    // sort(sortedPoses.begin(), sortedPoses.end(), compareByDistance); //the first state will be the nearest human!! no need to identy every people



    /*dynamic group*/
    /*calculate group center*/
    // vector<geometry_msgs::Pose> sorted_group_cent; 
    // geometry_msgs::Pose pose_diff_gp;



    // vector<geometry_msgs::Pose> sortedPoses; // 复制一份以避免修改原始数据
    // vector<geometry_msgs::Pose> sortedPoses_mid;
    // geometry_msgs::Pose pose_diff;
    // geometry_msgs::Pose pose_mid_1, pose_mid_2;

    // pose_mid_1.position.x = (poses[0].position.x + poses[1].position.x)/2;
    // pose_mid_1.position.y = (poses[0].position.y + poses[1].position.y)/2;
    // sortedPoses_mid.push_back(pose_mid_1);
    // pose_mid_2.position.x = (poses[2].position.x + poses[3].position.x)/2;
    // pose_mid_2.position.y = (poses[2].position.y + poses[3].position.y)/2;
    // sortedPoses_mid.push_back(pose_mid_2);

    // for(int j = 0; j< agent_size/2; j++){ //j<agent_size (when human size not declare)
    //     pose_diff.position.x = abs(sortedPoses_mid[j].position.x - robot_pose.position.x);
    //     pose_diff.position.y = abs(sortedPoses_mid[j].position.y - robot_pose.position.y);
    //     sortedPoses.push_back(pose_diff);
    // }

    // sort(sortedPoses.begin(), sortedPoses.end(), compareByDistance); //the first state will be the nearest human!! no need to identy every people

    // for(int k = 0; k < agent_size/2 ; k += 2){
    //     pose_diff_gp.position.x = abs(sortedPoses[k].position.x  - robot_pose.position.x);
    //     pose_diff_gp.position.y = abs(sortedPoses[k].position.y  - robot_pose.position.y);
    //     sorted_group_cent.push_back(pose_diff_gp);
    // }

    vector<float> distances_below_threshold;

    float threshold = 2;

    float distance = sortedPoses[0].position.x + sortedPoses[0].position.y; //abs(delta_x)+abs(delta_y)
    if(distance >= threshold){
        distances_below_threshold.push_back(2);
    }
    else{
        distances_below_threshold.push_back(distance);
    }


    // writeToCSV_human("/home/developer/master_ws/master_robot/mars_ws/src/path_assessment/src/data/robot_positions_1.csv",distances_below_threshold, distances_between_threshold_and_upper_bound);
    writeToCSV_human("/home/developer/master_ws/master_robot/mars_ws/src/path_assessment/src/data/social_human_collide_index_astar_full_scene_test1.csv",distances_below_threshold);

}

// 回调函数，处理 robot state 消息
void amclPoseCallback(const geometry_msgs::PoseWithCovarianceStamped::ConstPtr& robot_msg)
{
    
    // vector<string> model_names = robot_msg->name;
    geometry_msgs::Pose poses = robot_msg->pose.pose;

    if (!robot_msg) {
        ROS_WARN("Received null robot_state message.");
        return;
    }
			
    double robot_x = poses.position.x;
    double robot_y = poses.position.y;

    writeToCSV_robot("/home/developer/master_ws/master_robot/mars_ws/src/path_assessment/src/data/robot_position_test1.csv", robot_x, robot_y);
}

// 回调函数，处理 human_detection state 消息
void humanDetectionCallback(const visualization_msgs::MarkerArray::ConstPtr& human_det_msg)
{
    

    if (!human_det_msg) {
        ROS_WARN("Received null robot_state message.");
        return;
    }

			// 创建一个 vector 用于存储不同人的位置
    std::vector<std::vector<HumanPoseVel>> groups;
    double group_dis_cost = 1.5; // 群组之间的距离阈值
    double group_id_counter = 0; // 群组的編號計數器
    double individual_id_counter = 0; // 個體的編號計數器

    // 迭代处理 MarkerArray 中的每一个 Marker
    for (const auto& marker : human_det_msg->markers)
    {
        // 检查 Marker 的命名空间，确保是人的标记
        if (marker.ns == "object")
        {
            // 获取每个 Marker 的位置信息
            HumanPoseVel human;
            human.pose = marker.pose;

            // 尝试将行人加入已有的群组
            bool found_group = false;
            for (auto& group : groups) {
                for (const auto& member : group) {
                    double distance = sqrt(pow(human.pose.position.x - member.pose.position.x, 2) +
                                           pow(human.pose.position.y - member.pose.position.y, 2));
                    if (distance < group_dis_cost) {
                        // 如果距离小于群组距离阈值，将行人加入这个群组
                        group.push_back(human);
                        found_group = true;
                        break;
                    }
                }
                if (found_group) break;
            }

            // 如果没有找到合适的群组，则创建一个新的群组
            if (!found_group) {
                std::vector<HumanPoseVel> new_group;
                new_group.push_back(human);
                groups.push_back(new_group);
            }
        }
    }

    // 遍历群组，根据群组大小调用不同的函数
    for(auto& group : groups){
        if(group.size() > 1 ){      // 如果群组大小大于1，表示为群组
            double group_id = group_id_counter++;
            // 计算群组中所有人的平均位置
            double avg_x = 0.0, avg_y = 0.0;
            for(const auto& member : group){
                avg_x += member.pose.position.x;
                avg_y += member.pose.position.y;
            }
            avg_x /= group.size();
            avg_y /= group.size();
            // 输出平均位置
            ROS_INFO("Group %f - Average Position: (%f, %f)", group_id,avg_x, avg_y);
            writeToCSV_human_dis("/home/developer/master_ws/master_robot/mars_ws/src/path_assessment/src/data/human_position_group_test1.csv", avg_x, avg_y, group_id);

        }
        else{ // 如果群组大小等于1，表示为单个人
            int individual_id = individual_id_counter++;
            // 输出单个人的位置
            ROS_INFO("Individual %f - Position: (%f, %f)", individual_id,group[0].pose.position.x, group[0].pose.position.y);
            writeToCSV_human_dis("/home/developer/master_ws/master_robot/mars_ws/src/path_assessment/src/data/human_position_individual_test1.csv", group[0].pose.position.x, group[0].pose.position.y, individual_id);
        }
    }

}




int main(int argc, char** argv)
{
    // 初始化 ROS 节点
    ros::init(argc, argv, "collide_detection");
    ros::NodeHandle nh;

    // 订阅 global costmap 话题
    ros::Subscriber costmap_sub = nh.subscribe("/move_base/global_costmap/costmap", 10, costmapCallback);
    // 订阅 model state 话题
    // ros::Subscriber model_state_sub = nh.subscribe("/gazebo/model_states", 10, modelStateCallback);
    // 订阅 pedsim human 话题
    // ros::Subscriber human_state_sub = nh.subscribe("/pedsim_simulator/simulated_agents" , 10, humanStateCallback);
    /* for real world exp*/
    // 订阅 amcl_pose 话题
    ros::Subscriber robot_state_sub = nh.subscribe("/amcl_pose" , 10, amclPoseCallback);
    // 订阅 amcl_pose 话题
    ros::Subscriber human_detection_sub = nh.subscribe("/trk3d_vis" , 10, humanDetectionCallback);

    // 循环等待回调函数
    ros::spin();

    return 0;
}
