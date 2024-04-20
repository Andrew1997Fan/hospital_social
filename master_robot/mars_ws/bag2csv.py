import rosbag
import csv

def convert_rosbag_to_csv(rosbag_file, topics, output_csv):
    with rosbag.Bag(rosbag_file, 'r') as bag:
        with open(output_csv, 'w', newline='') as csv_file:
            writer = csv.DictWriter(csv_file, fieldnames=topics)
            writer.writeheader()
            
            for topic, msg, t in bag.read_messages(topics=topics):
                data = {}
                data['timestamp'] = t.to_sec()  # 將時間戳轉換為秒
                for field in msg.__slots__:
                    data[field] = getattr(msg, field)
                writer.writerow(data)

if __name__ == "__main__":
    # 輸入rosbag文件的路徑
    rosbag_file = "static_individual_2024-04-20-18-43-02.bag"
    # 選擇要提取的話題
    topics = ['/gazebo/model_states','/move_base/DWAPlannerROS/global_plan/pose/position/x']  # 將 '/topic1', '/topic2' 替換為你要提取的實際話題
    # 指定輸出CSV文件的路徑
    output_csv = "output.csv"
    
    convert_rosbag_to_csv(rosbag_file, topics, output_csv)

