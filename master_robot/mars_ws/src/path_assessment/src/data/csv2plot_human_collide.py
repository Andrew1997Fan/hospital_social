import numpy as np
import matplotlib.pyplot as plt
import csv

file_path = 'social_human_collide_index_astar_dynamic_individual_test5.csv'

# need to change every time based on video time
# for static person sampling rate = 320
sample_rate = 320
# for dynamic person sampling rate = 13
# sample_rate = 13

# 读取CSV文件并提取数据
data = []
with open(file_path, 'r') as file:
    reader = csv.reader(file)
    count = 0
    for row in reader:
        for item in row:
            if item:
                data.append(float(item))
                # if count % sample_rate == 0:
                #     data.append(float(item))  # 將每個數據減去 0.55
                # count += 1
# for individual static threshold = 0.65
# for group static threshold = 1.3(cause center are in the middle of human)
# Calculate time axis based on sample rate
# time_axis = np.arange(len(data)) / sample_rate
time_axis = np.arange(len(data))/sample_rate

# 绘制数据，根据条件设置线段颜色
plt.plot(time_axis, data, color='blue', label='Data')
for i in range(len(data)-1):
    if data[i] < 1 and data[i+1] < 1:
        plt.plot([time_axis[i], time_axis[i+1]], [data[i], data[i+1]], color='red')

plt.axhline(y=1, color='red', linestyle='--', label='Threshold')  # 添加標籤

plt.xlabel('Time(sec)')
plt.ylabel('Distance(m)')  # 修改 y 軸標籤
plt.title('Human and Robot Distance')
plt.grid(True)

# 加上圖例
plt.legend()

# 設定y軸範圍
plt.ylim(0, 2.03)  # 修改 y 軸範圍 because need to minus Robot and Human real world body size

save_file = 'social_human_collide_index_astar_dynamic_individual_test5.png'
plt.savefig(save_file)
print(f"Saved plot as {save_file}")
