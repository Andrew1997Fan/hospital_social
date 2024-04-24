import csv
import matplotlib.pyplot as plt
import numpy as np
from scipy.interpolate import interp1d
from scipy.interpolate import CubicSpline

# 讀取CSV文件
file_path = 'social_astar_static_individual_test4.csv'  # 請將data.csv替換為你的CSV文件路徑
with open(file_path, 'r') as file:
    lines = file.readlines()

# 提取x和y值
x_values = []
y_values = []
for line in lines:
    values = line.strip().split(',')
    x_values.append(float(values[0]))
    y_values.append(float(values[1]))



# 設置圖形尺寸
# plt.figure(figsize=(8, 6))
plt.figure(figsize=(6, 18))

plt.plot(x_values, y_values, color='red', linewidth=3, label='Path',zorder=1)  # 路徑顏色設置為淺藍色，並設置線寬為2


plt.scatter(x_values[0], y_values[0], marker='v' , s=100,color='blue', label='Start' , zorder=2)  # 起點顏色設置為藍色 # ^=up tri, v=down tri
plt.scatter(x_values[-1], y_values[-1], marker='*' , s=100,color='red', label='End', zorder=2)  # 終點顏色設置為紅色

# 在 x 等於 6.5 和 3.5 的位置處繪製直線代表牆壁
plt.axvline(x=6.5, color='black',linewidth=2, linestyle='--', label='Wall')
plt.axvline(x=3.5, color='black',linewidth=2, linestyle='--')

# 添加靜態人體座標
static_human_poses = [[5.0, -2.0], [5.0, -6.0]]
for pose in static_human_poses:
    circle = plt.Circle((pose[0], pose[1]), 0.45, color='lightgray', zorder=3)
    plt.gca().add_patch(circle)



plt.xlabel('X-axis(m)')  # 設置X軸標籤
plt.ylabel('Y-axis(m)')  # 設置Y軸標籤
plt.title('Path Plot')  # 設置圖表標題


# plt.ylim(-25, 5)
# plt.axis('equal')  # 設置 x 和 y 軸的比例尺相同長度
plt.grid(True)  # 顯示網格

# # 標注起點
# plt.text(x_values[0], y_values[0], 'Start', fontsize=12, verticalalignment='bottom', horizontalalignment='right', color='blue')  # 起點顏色設置為藍色

# # 標注終點
# plt.text(x_values[-1], y_values[-1], 'End', fontsize=12, verticalalignment='top', horizontalalignment='left', color='red')  # 終點顏色設置為紅色

# 加上圖例
plt.legend()

# 設置 x 軸刻度值
plt.xticks(np.arange(2.5, 8.5, 1))

save_file = 'social_astar_static_individual_test4.png'
plt.savefig(save_file)
print(f"Saved plot as {save_file}")

