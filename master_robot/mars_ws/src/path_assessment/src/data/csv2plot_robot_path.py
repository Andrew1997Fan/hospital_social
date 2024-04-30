import csv
import matplotlib.pyplot as plt
import numpy as np
from scipy.interpolate import interp1d
from scipy.interpolate import CubicSpline
from matplotlib.patches import Ellipse

# 讀取CSV文件
file_path = 'social_astar_dynamic_individual_test5.csv'  # 請將data.csv替換為你的CSV文件路徑
with open(file_path, 'r') as file:
    lines = file.readlines()

# 提取x和y值
x_values = []
y_values = []
for line in lines:
    values = line.strip().split(',')
    if len(values) >= 2:  # 檢查列表是否包含至少兩個值
        x_values.append(float(values[0]))
        y_values.append(float(values[1]))

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
plt.figure(figsize=(6, 18)) # for corridor

plt.plot(x_values, y_values, color='red', linewidth=3, label='Path',zorder=1)  # 路徑顏色設置為淺藍色，並設置線寬為2


plt.scatter(x_values[0], y_values[0], marker='v' , s=100,color='blue', label='Start' , zorder=2)  # 起點顏色設置為藍色 # ^=up tri, v=down tri
plt.scatter(x_values[-1], y_values[-1], marker='*' , s=100,color='red', label='End', zorder=2)  # 終點顏色設置為紅色

# 在 x 等於 6.5 和 3.5 的位置處繪製直線代表牆壁
plt.axvline(x=6.5, color='black',linewidth=2, linestyle='--', label='Wall')
plt.axvline(x=3.5, color='black',linewidth=2, linestyle='--')
# plt.plot([5, 5], [-10, 5], color='gray', linestyle='--', label='Pedestrian')  # 行人路線為灰色虛線，起始位置為(5, -10)，結束位置為(5, 5)


# 添加靜態人體座標
# [{5.0, -2.0}, {5.0, -6.0}] for static individual
# [2.5, 10.75], [-2.0, 11.25] for static group mean values
# 創建橢圓形
# x_1= 5
# y_1 = -10
# # x_2 = -2.0
# # y_2 = 11.25
# ellipse = Ellipse(xy=(x_1,y_1), width=1.3, height=2.5, edgecolor='black', facecolor='none', zorder=3)
# plt.gca().add_patch(ellipse)
# ellipse = Ellipse(xy=(x_2,y_2), width=1.3, height=2.5, edgecolor='black', facecolor='none', zorder=3)
# # 添加橢圓形到圖上
# plt.gca().add_patch(ellipse)

# static_human_poses = [[2.5, 10], [2.5, 11.5],[-2,10.5] ,[-2,12]]
# static_human_poses = [[5, -10]]
# for pose in static_human_poses:
#     circle = plt.Circle((pose[0], pose[1]), 0.4, color='lightgray', zorder=1)
#     plt.gca().add_patch(circle)



plt.xlabel('X-axis(m)')  # 設置X軸標籤
plt.ylabel('Y-axis(m)')  # 設置Y軸標籤
plt.title('Path Plot')  # 設置圖表標題


plt.ylim(-25, 5)
plt.axis('equal')  # 設置 x 和 y 軸的比例尺相同長度
plt.grid(True)  # 顯示網格

# # 標注起點
# plt.text(x_values[0], y_values[0], 'Start', fontsize=12, verticalalignment='bottom', horizontalalignment='right', color='blue')  # 起點顏色設置為藍色

# # 標注終點
# plt.text(x_values[-1], y_values[-1], 'End', fontsize=12, verticalalignment='top', horizontalalignment='left', color='red')  # 終點顏色設置為紅色

# 加上圖例
plt.legend(loc='upper right')

# 設置 x 軸刻度值
plt.xticks(np.arange(2.5, 8.5, 1))

save_file = 'social_astar_dynamic_individual_test5.png'
plt.savefig(save_file)
print(f"Saved plot as {save_file}")

