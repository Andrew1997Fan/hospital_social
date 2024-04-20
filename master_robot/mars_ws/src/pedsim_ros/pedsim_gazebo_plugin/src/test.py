#!/usr/bin/env python3
import rospy
from gazebo_msgs.msg import ModelStates

def model_states_callback(msg):
    for model_name in msg.name:
        print(model_name)

rospy.init_node('model_state_listener')
rospy.Subscriber('/gazebo/model_states', ModelStates, model_states_callback)
rospy.spin()

