# Install script for directory: /home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/developer/master_ws/master_robot/yolo_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/human_msgs/msg" TYPE FILE FILES
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/HumanPath.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/HumanPathArray.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/HumanTimeToGoal.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/HumanTimeToGoalArray.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/HumanTrajectory.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/HumanTrajectoryArray.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/HumanTwist.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/HumanTwistArray.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/TimeToGoal.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/TrackedSegment.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/TrackedHuman.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/TrackedHumanArray.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/TrackedHumans.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/TrackedSegmentType.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/Trajectory.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/TrajectoryArray.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/TrajectoryPoint.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/TrajectoryPointMsg.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/TrajectoryMsg.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/StateArray.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/HumanMarker.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/HumanMarkerStamped.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/HumanArray.msg"
    "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/msg/TwistArray.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/human_msgs/cmake" TYPE FILE FILES "/home/developer/master_ws/master_robot/yolo_ws/build/msgs/human_msgs/catkin_generated/installspace/human_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/developer/master_ws/master_robot/yolo_ws/devel/include/human_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/developer/master_ws/master_robot/yolo_ws/devel/share/roseus/ros/human_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/developer/master_ws/master_robot/yolo_ws/devel/share/common-lisp/ros/human_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/developer/master_ws/master_robot/yolo_ws/devel/share/gennodejs/ros/human_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/developer/master_ws/master_robot/yolo_ws/devel/lib/python3/dist-packages/human_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/developer/master_ws/master_robot/yolo_ws/devel/lib/python3/dist-packages/human_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/developer/master_ws/master_robot/yolo_ws/build/msgs/human_msgs/catkin_generated/installspace/human_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/human_msgs/cmake" TYPE FILE FILES "/home/developer/master_ws/master_robot/yolo_ws/build/msgs/human_msgs/catkin_generated/installspace/human_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/human_msgs/cmake" TYPE FILE FILES
    "/home/developer/master_ws/master_robot/yolo_ws/build/msgs/human_msgs/catkin_generated/installspace/human_msgsConfig.cmake"
    "/home/developer/master_ws/master_robot/yolo_ws/build/msgs/human_msgs/catkin_generated/installspace/human_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/human_msgs" TYPE FILE FILES "/home/developer/master_ws/master_robot/yolo_ws/src/msgs/human_msgs/package.xml")
endif()

