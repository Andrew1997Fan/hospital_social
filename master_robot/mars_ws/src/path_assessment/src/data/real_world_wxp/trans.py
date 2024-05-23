import pandas as pd
import numpy as np
import math

def rotate_point(x, y, angle):
    # 将角度转换为弧度
    radians = math.radians(angle)
    cos_angle = math.cos(radians)
    sin_angle = math.sin(radians)
    
    # 旋转矩阵应用于点 (x, y)
    x_new = x * cos_angle + y * sin_angle
    y_new = -x * sin_angle + y * cos_angle
    
    return x_new, y_new

# 读取 CSV 文件
input_csv = 'amcl_pose_test12.csv'  # 输入文件名
output_csv = 'good_robot_path.csv'  # 输出文件名
df = pd.read_csv(input_csv)

# 假设 CSV 文件有两列，分别是 'x' 和 'y'
angle = 45  # 顺时针旋转45度
df[['x', 'y']] = df.apply(lambda row: rotate_point(row['x'], row['y'], angle), axis=1, result_type='expand')

# 将结果保存到新的 CSV 文件
df.to_csv(output_csv, index=False)

print(f"旋转后的坐标已保存到 {output_csv}")

