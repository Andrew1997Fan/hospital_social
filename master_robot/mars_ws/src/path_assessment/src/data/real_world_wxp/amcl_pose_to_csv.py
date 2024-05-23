#!/usr/bin/env python3

import rospy
from geometry_msgs.msg import PoseWithCovarianceStamped
import csv
import os

# 定義CSV檔案的路徑
csv_file_path = os.path.expanduser('/home/developer/master_ws/master_robot/mars_ws/src/path_assessment/src/data/amcl_pose_test1.csv')

# 確保目標目錄存在
os.makedirs(os.path.dirname(csv_file_path), exist_ok=True)

# 初始化CSV檔案並寫入標題
with open(csv_file_path, 'w') as csvfile:
    csv_writer = csv.writer(csvfile)
    csv_writer.writerow(['x', 'y'])

def callback(data):
    # 從 PoseWithCovarianceStamped 訊息中提取 x 和 y 座標
    x = data.pose.pose.position.x
    y = data.pose.pose.position.y

    # 將資料寫入CSV檔案
    with open(csv_file_path, 'a') as csvfile:
        csv_writer = csv.writer(csvfile)
        csv_writer.writerow([x, y])
    
    # 在終端顯示添加的資料
    rospy.loginfo(f'Added data: x={x}, y={y}')

def listener():
    # 初始化 ROS 節點
    rospy.init_node('amcl_pose_to_csv', anonymous=True)
    
    # 訂閱 /amcl_pose topic
    rospy.Subscriber('/amcl_pose', PoseWithCovarianceStamped, callback)
    
    # 保持節點運行直到被中斷
    rospy.spin()

if __name__ == '__main__':
    listener()
