import csv
import matplotlib.pyplot as plt
import numpy as np
from scipy.interpolate import interp1d
from scipy.interpolate import CubicSpline
from matplotlib.patches import Ellipse
from matplotlib.patches import Rectangle, Polygon, Circle

sampling_rate = 1
threshold = 10 * sampling_rate  # 設定閾值為50000


# 讀取CSV文件
file_path = 'good_robot_path.csv'  # 請將data.csv替換為你的CSV文件路徑
with open(file_path, 'r') as file:
    lines = file.readlines()

# 使用列表來存儲數據
x_values_solid = []
y_values_solid = []
x_values_dashed = []
y_values_dashed = []

# 提取x和y值，並設置取樣率
for i in range(1, len(lines), sampling_rate): #for i in range(0, len(lines), sampling_rate):
    values = lines[i].strip().split(',')
    if len(values) >= 2:  # 檢查列表是否包含至少兩個值
        x_value = float(values[0])
        y_value = float(values[1])
        
        if i < threshold:  # 第5000筆取樣點（即原始數據中的50000筆資料）以前
            x_values_solid.append(x_value)
            y_values_solid.append(y_value)
        else:  # 第5000筆取樣點以後
            x_values_dashed.append(x_value)
            y_values_dashed.append(y_value)

# 將列表轉換為numpy數組
x_values_solid = np.array(x_values_solid)
y_values_solid = np.array(y_values_solid)
x_values_dashed = np.array(x_values_dashed)
y_values_dashed = np.array(y_values_dashed)



# 提取x和y值
# x_values = []
# y_values = []
# for line in lines:
#     values = line.strip().split(',')
#     if len(values) >= 2:  # 檢查列表是否包含至少兩個值
#         x_values.append(float(values[0]))
#         y_values.append(float(values[1]))

# 提取x和y值，並設置取樣率
# x_values = []
# y_values = []
# for i in range(0, len(lines), sampling_rate):
#     values = lines[i].strip().split(',')
#     if len(values) >= 2:  # 檢查列表是否包含至少兩個值
#         x_values.append(float(values[0]))
#         y_values.append(float(values[1]))

# # 讀取CSV文件2
# file_path = 'astar_full_scene_test1.csv'  # 請將data.csv替換為你的CSV文件路徑
# with open(file_path, 'r') as file:
#     lines_2 = file.readlines()

# # 使用列表來存儲數據
# x_values_solid_2 = []
# y_values_solid_2 = []
# x_values_dashed_2 = []
# y_values_dashed_2 = []

# # 提取x和y值，並設置取樣率
# for j in range(0, len(lines_2), sampling_rate):
#     values_2 = lines_2[j].strip().split(',')
#     if len(values_2) >= 2:  # 檢查列表是否包含至少兩個值
#         x_value_2 = float(values_2[0])
#         y_value_2 = float(values_2[1])
        
#         if j < threshold:  # 第5000筆取樣點（即原始數據中的50000筆資料）以前
#             x_values_solid_2.append(x_value_2)
#             y_values_solid_2.append(y_value_2)
#         else:  # 第5000筆取樣點以後
#             x_values_dashed_2.append(x_value_2)
#             y_values_dashed_2.append(y_value_2)

# # 將列表轉換為numpy數組
# x_values_solid_2 = np.array(x_values_solid_2)
# y_values_solid_2 = np.array(y_values_solid_2)
# x_values_dashed_2 = np.array(x_values_dashed_2)
# y_values_dashed_2 = np.array(y_values_dashed_2)

# 繪製圖表
# plt.figure(figsize=(10, 6))
plt.figure(figsize=(10, 6))

# 繪製實線部分
plt.plot(x_values_solid, y_values_solid, linestyle='-', color='r')

# 繪製虛線部分
plt.plot(x_values_dashed, y_values_dashed, label='Ours', linestyle=(0, (5, 3)), color='r')

# # 繪製實線部分
# plt.plot(x_values_solid_2, y_values_solid_2, linestyle='-', color='b')

# # 繪製虛線部分
# plt.plot(x_values_dashed_2, y_values_dashed_2, label='Original', linestyle=(0, (5, 3)), color='b')
# # # 提取x和y值
# x_values_2 = []
# y_values_2 = []
# # for line_2 in lines_2:
# #     values_2 = line_2.strip().split(',')
# #     if len(values) >= 2:  # 檢查列表是否包含至少兩個值
# #         x_values_2.append(float(values_2[0]))
# #         y_values_2.append(float(values_2[1]))
# for j in range(0, len(lines_2), sampling_rate):
#     values_2 = lines_2[j].strip().split(',')
#     if len(values_2) >= 2:  # 檢查列表是否包含至少兩個值
#         x_values_2.append(float(values_2[0]))
#         y_values_2.append(float(values_2[1]))

# 交換x和y值(for long png) 
# x_values, y_values = y_values, x_values


# for idx, line in enumerate(lines):
#     values = line.strip().split(',')
#     if len(values) >= 2:
#         try:
#             x_values.append(float(values[0]))
#             y_values.append(float(values[1]))
#         except ValueError:
#             print(f"Error converting line {idx + 1}: {line}")
# 設置圖形尺寸

# plt.figure(figsize=(8, 6)) # for large space
# plt.figure(figsize=(6, 18)) # for corridor

# 繪製所有數據
# for i in range(len(x_values) - 1):
#     if x_values[i] > -1 and x_values[i+1] > -1:
#         plt.plot([x_values[i], x_values[i+1]], [y_values[i], y_values[i+1]], color='red', linewidth=3, zorder=1)
#     elif x_values[i] <= -1 and x_values[i+1] <= -1:
#         plt.plot([x_values[i], x_values[i+1]], [y_values[i], y_values[i+1]], color='red', linewidth=3, linestyle='--', zorder=1)
#     else:
#         # 分割點的x坐標跨越2，對應的y值用虛線與實線連接
#         split_point_x = -1
#         split_point_y = y_values[i] + (y_values[i+1] - y_values[i]) * (split_point_x - x_values[i]) / (x_values[i+1] - x_values[i])
#         plt.plot([x_values[i], split_point_x], [y_values[i], split_point_y], color='red', linewidth=3, linestyle='--', zorder=1)
#         plt.plot([split_point_x, x_values[i+1]], [split_point_y, y_values[i+1]], color='red', linewidth=3, zorder=1)

# for i in range(len(x_values_2) - 1):
#     if x_values_2[i] > -1 and x_values_2[i+1] > -1:
#         plt.plot([x_values_2[i], x_values_2[i+1]], [y_values_2[i], y_values_2[i+1]], color='blue', linewidth=3, zorder=1)
#     elif x_values_2[i] <= -1 and x_values_2[i+1] <= -1:
#         plt.plot([x_values_2[i], x_values_2[i+1]], [y_values_2[i], y_values_2[i+1]], color='blue', linewidth=3, linestyle='--', dashes=(5, 10), zorder=1)
#     else:
#         # 分割點的x坐標跨越-1，對應的y值用虛線與實線連接
#         split_point_x = -1
#         split_point_y = y_values_2[i] + (y_values_2[i+1] - y_values_2[i]) * (split_point_x - x_values_2[i]) / (x_values_2[i+1] - x_values_2[i])
#         plt.plot([x_values_2[i], split_point_x], [y_values_2[i], split_point_y], color='blue', linewidth=3, linestyle='--', dashes=(5, 10), zorder=1)
#         plt.plot([split_point_x, x_values_2[i+1]], [split_point_y, y_values_2[i+1]], color='blue', linewidth=3, zorder=1)


# plt.plot(x_values, y_values, color='red', linewidth=3, label='Ours',zorder=1)  # 路徑顏色設置為淺藍色，並設置線寬為2
plt.scatter(x_values_solid[0], y_values_solid[0], marker='<' , s=100,color='blue', label='Start' , zorder=2)  # 起點顏色設置為藍色 # ^=up tri, v=down tri
plt.scatter(x_values_dashed[-1], y_values_dashed[-1], marker='*' , s=100,color='red', label='End', zorder=2)  # 終點顏色設置為紅色

# plt.plot(x_values_2, y_values_2, color='blue', linewidth=3, label='Original',zorder=1)  # 路徑顏色設置為淺藍色，並設置線寬為2 #line2
# plt.scatter(x_values_2[0], y_values_2[0], marker='>' , s=100,color='blue', zorder=2)  # 起點顏色設置為藍色 # ^=up tri, v=down tri
# plt.scatter(x_values_2[-1], y_values_2[-1], marker='*' , s=100,color='red', zorder=2)  # 終點顏色設置為紅色
# # 在 x 等於 6.5 和 3.5 的位置處繪製直線代表牆壁
# plt.axvline(x=6.5, color='black',linewidth=2, linestyle='--', label='Wall')
# plt.axvline(x=3.5, color='black',linewidth=2, linestyle='--')
# plt.plot([5, 5], [-10, 5], color='gray', linestyle='--', label='Pedestrian')  # 行人路線為灰色虛線，起始位置為(5, -10)，結束位置為(5, 5)


# 添加靜態人體座標
# [{5.0, -2.0}, {5.0, -6.0}] for static individual
# [2.5, 10.75], [-2.0, 11.25] for static group mean values

# # 創建橢圓形
# x_1= 0
# y_1 = -7.75
# # x_2 = -2/3
# # y_2 = 31.5/3
# ellipse = Ellipse(xy=(x_1,y_1), width=0.5, height=1.2,edgecolor='black', facecolor='none', zorder=3) #angle for turn the ellipse
# plt.gca().add_patch(ellipse)
# plt.arrow(x_1, y_1, -0.5, 0, head_width=0.2, head_length=0.2, fc='black', ec='black')
# plt.text(x_1 + 1.0, y_1 - 1, '0.15m/s', fontsize=16)

# # ellipse = Ellipse(xy=(x_2,y_2), width=1.3, height=2.5,edgecolor='black', facecolor='none', zorder=3) #angle for turn the ellipse
# # plt.gca().add_patch(ellipse)
# # plt.arrow(x_2, y_2, 1.5, 0, head_width=0.2, head_length=0.2, fc='black', ec='black')
# # plt.text(x_2 + 1.0, y_2 - 1, '0.15m/s', fontsize=16)

# ellipse = Circle(xy=(x_2, y_2), radius=1.1, edgecolor='black', facecolor='none', zorder=3)
# plt.gca().add_patch(ellipse)
# plt.arrow(x_2-1.1, y_2, -1.5, 0, head_width=0.7, head_length=0.3, fc='black', ec='black')
# plt.text(x_2 - 6.0, y_2 + 1, '0.15m/s', fontsize=16)

# 添加橢圓形到圖上
# plt.gca().add_patch(ellipse)

# static_human_poses = [[2.5, 10], [2.5, 11.5],[-2,10.5] ,[-2,12]]
static_human_poses = [[-3, -3.5]]
# static_human_poses = [[0,-7.5],[0,-8]]
# static_human_poses = [[-5,5],[-2,5]]
# static_human_poses = [[1,10.5],[1,12],[5,10.5],[5,12]] #for dynamic group1
# static_human_poses = [[6,10.5],[6,12],[2,10.5],[2,12]] #for dynamic group2
# static_human_poses = [[0, 11.0]] #for wheelchair
# static_human_poses_wc = [[-2,9]] # for full scene wheelchair
# for normal human
for pose in static_human_poses:
    circle = plt.Circle((pose[0], pose[1]), 0.2, color='lightgray', zorder=1)
    plt.gca().add_patch(circle)
# #     # Add arrow indicating direction for dynamic human
    plt.arrow(pose[0], pose[1], 0.7, 0.0, head_width=0.2, head_length=0.2, fc='black', ec='black')
#     # Add text indicating speed
    # plt.text(pose[0] + 0.5, pose[1] + 0.5, '0.15m/s', fontsize=16)
# for wheel chair figure
# for pose in static_human_poses_wc:
#     # Create a rectangle to represent the wheelchair
#     wheelchair_width = 1.0
#     wheelchair_height = 0.8
#     wheelchair = Rectangle((pose[0] - wheelchair_width / 2, pose[1] - wheelchair_height / 2), 
#                            wheelchair_width, wheelchair_height, 
#                            color='lightgray', zorder=1)
#     plt.gca().add_patch(wheelchair)

# static_human_poses = [[5.5,-5],[2,7],[3,8],[-1,11],[-1,10],[0,10.5],[5,-7.5]] # for full scene static human T = 75
# static_human_poses = [[5.5,-5],[2,7],[3,8],[-10,11],[-10,10],[-9,10.5],[5,2.5]] # for full scene static human t = 221
# for pose in static_human_poses:
#     # Create a rectangle to represent the wheelchair
#     circle = plt.Circle((pose[0], pose[1]), 0.4, color='lightgray', zorder=1)
#     plt.gca().add_patch(circle)

# x_3 = 5
# y_3 = -7.5
# plt.arrow(x_3, y_3+0.5, 0, 1.5, head_width=0.8, head_length=0.3, fc='black', ec='black')
# plt.text(x_3 +1, y_3+0.5, '0.15m/s', fontsize=16)
#

plt.xlabel('X-axis(m)')  # 設置X軸標籤
plt.ylabel('Y-axis(m)')  # 設置Y軸標籤
plt.title('Path Plot')  # 設置圖表標題

plt.ylim(8, 13)  # 调整 y 轴范围
# plt.ylim(-25, 5)
plt.axis('equal')  # 設置 x 和 y 軸的比例尺相同長度
# plt.grid(True)  # 顯示網格

# # 標注起點
# plt.text(x_values[0], y_values[0], 'Start', fontsize=12, verticalalignment='bottom', horizontalalignment='right', color='blue')  # 起點顏色設置為藍色

# # 標注終點
# plt.text(x_values[-1], y_values[-1], 'End', fontsize=12, verticalalignment='top', horizontalalignment='left', color='red')  # 終點顏色設置為紅色


# 加上圖例
plt.legend(loc='upper right')

# 設置 x 軸刻度值
# plt.xticks(np.arange(2.5, 8.5, 1))

save_file = 'good_robot_path_T8.png'
plt.savefig(save_file)
print(f"Saved plot as {save_file}")

