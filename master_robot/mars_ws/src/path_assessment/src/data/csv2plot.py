import csv
import matplotlib.pyplot as plt

def plot_path_from_csv(csv_file, save_file=None):
    # 讀取 CSV 檔案
    with open(csv_file, 'r') as file:
        reader = csv.reader(file)
        next(reader)  # 跳過標頭行
        x_values = []
        y_values = []
        for row in reader:
            # 將 x 和 y 資料加入列表中
            x_values.append(float(row[0]))
            y_values.append(float(row[1]))

    # 繪製路徑圖
    plt.figure()
    plt.plot(x_values, y_values, marker='o', linestyle='-', color='lightgray', label='Path')  # 淺色路線
    plt.plot(x_values[0], y_values[0], marker='o', markersize=10, color='red', label='Start')  # 起點
    plt.plot(x_values[-1], y_values[-1], marker='o', markersize=10, color='blue', label='End')  # 終點
    plt.xlabel('X')
    plt.ylabel('Y')
    plt.title('Robot Path')
    plt.grid(True)
    
    # 設定 x 和 y 軸的比例尺相同長度
    plt.axis('equal')
    
    # 加上圖例
    plt.legend()
    
    # 儲存圖形
    if save_file:
        plt.savefig(save_file)
        print(f"Saved plot as {save_file}")
    else:
        plt.show()

# 要讀取的 CSV 檔案名稱
csv_file = 'robot_positions.csv'
# 要儲存的檔案名稱，如果為 None，則不儲存，只顯示圖形
save_file = 'robot_path_plot.png'
plot_path_from_csv(csv_file, save_file)
