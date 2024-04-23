import numpy as np
import matplotlib.pyplot as plt
import csv

file_path = 'human_collide_index_social_astar_static_individual_test2.csv'

# 读取CSV文件并提取数据
data = []
with open(file_path, 'r') as file:
    reader = csv.reader(file)
    for row in reader:
        for item in row:
            if item:
                data.append(float(item))

# 绘制数据，根据条件设置线段颜色
plt.plot(data, color='blue')  # 默认颜色为蓝色
for i in range(len(data)-1):
    if data[i] < 0.45 or data[i+1] < 0.45:
        plt.plot([i, i+1], [data[i], data[i+1]], color='red')

plt.axhline(y=0.45, color='red', linestyle='--')

plt.xlabel('X Label')
plt.ylabel('Y Label')
plt.title('Human Collide Index')
plt.grid(True)


# 加上圖例
plt.legend()

# 設定y軸範圍
plt.ylim(0, 1.2)
# 調整 x 軸的範圍
# plt.xlim(left=0)

save_file = 'human_collide_index_social_astar_static_individual_test2_modified.png'
plt.savefig(save_file)
print(f"Saved plot as {save_file}")

# plt.show()
