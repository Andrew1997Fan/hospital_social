execute_process(COMMAND "/home/developer/master_ws/master_robot/mars_ws/build/navigation/turtlebot3_teleop/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/developer/master_ws/master_robot/mars_ws/build/navigation/turtlebot3_teleop/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
