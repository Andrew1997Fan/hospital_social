# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "detection_msgs: 7 messages, 1 services")

set(MSG_I_FLAGS "-Idetection_msgs:/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Inav_msgs:/opt/ros/noetic/share/nav_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Ivisualization_msgs:/opt/ros/noetic/share/visualization_msgs/cmake/../msg;-Idetection_msgs:/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(detection_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg" NAME_WE)
add_custom_target(_detection_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "detection_msgs" "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg" "geometry_msgs/Pose2D"
)

get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Detection2D.msg" NAME_WE)
add_custom_target(_detection_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "detection_msgs" "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Detection2D.msg" "sensor_msgs/Image:detection_msgs/BBox2D:geometry_msgs/Pose2D:std_msgs/Header"
)

get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3D.msg" NAME_WE)
add_custom_target(_detection_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "detection_msgs" "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3D.msg" ""
)

get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3DArray.msg" NAME_WE)
add_custom_target(_detection_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "detection_msgs" "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3DArray.msg" "sensor_msgs/PointCloud2:detection_msgs/Det3D:sensor_msgs/PointField:sensor_msgs/LaserScan:std_msgs/Header"
)

get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3D.msg" NAME_WE)
add_custom_target(_detection_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "detection_msgs" "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3D.msg" ""
)

get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3DArray.msg" NAME_WE)
add_custom_target(_detection_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "detection_msgs" "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3DArray.msg" "sensor_msgs/PointCloud2:detection_msgs/Track3D:sensor_msgs/PointField:sensor_msgs/LaserScan:std_msgs/Header"
)

get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/StringArray.msg" NAME_WE)
add_custom_target(_detection_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "detection_msgs" "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/StringArray.msg" ""
)

get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/srv/Detection2DTrig.srv" NAME_WE)
add_custom_target(_detection_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "detection_msgs" "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/srv/Detection2DTrig.srv" "detection_msgs/Detection2D:detection_msgs/BBox2D:geometry_msgs/Pose2D:sensor_msgs/Image:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection_msgs
)
_generate_msg_cpp(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Detection2D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection_msgs
)
_generate_msg_cpp(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection_msgs
)
_generate_msg_cpp(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3DArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/LaserScan.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection_msgs
)
_generate_msg_cpp(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection_msgs
)
_generate_msg_cpp(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3DArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/LaserScan.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection_msgs
)
_generate_msg_cpp(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/StringArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection_msgs
)

### Generating Services
_generate_srv_cpp(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/srv/Detection2DTrig.srv"
  "${MSG_I_FLAGS}"
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Detection2D.msg;/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection_msgs
)

### Generating Module File
_generate_module_cpp(detection_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(detection_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(detection_msgs_generate_messages detection_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_cpp _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Detection2D.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_cpp _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3D.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_cpp _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3DArray.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_cpp _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3D.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_cpp _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3DArray.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_cpp _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/StringArray.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_cpp _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/srv/Detection2DTrig.srv" NAME_WE)
add_dependencies(detection_msgs_generate_messages_cpp _detection_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(detection_msgs_gencpp)
add_dependencies(detection_msgs_gencpp detection_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS detection_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection_msgs
)
_generate_msg_eus(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Detection2D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection_msgs
)
_generate_msg_eus(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection_msgs
)
_generate_msg_eus(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3DArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/LaserScan.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection_msgs
)
_generate_msg_eus(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection_msgs
)
_generate_msg_eus(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3DArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/LaserScan.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection_msgs
)
_generate_msg_eus(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/StringArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection_msgs
)

### Generating Services
_generate_srv_eus(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/srv/Detection2DTrig.srv"
  "${MSG_I_FLAGS}"
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Detection2D.msg;/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection_msgs
)

### Generating Module File
_generate_module_eus(detection_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(detection_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(detection_msgs_generate_messages detection_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_eus _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Detection2D.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_eus _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3D.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_eus _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3DArray.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_eus _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3D.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_eus _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3DArray.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_eus _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/StringArray.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_eus _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/srv/Detection2DTrig.srv" NAME_WE)
add_dependencies(detection_msgs_generate_messages_eus _detection_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(detection_msgs_geneus)
add_dependencies(detection_msgs_geneus detection_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS detection_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection_msgs
)
_generate_msg_lisp(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Detection2D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection_msgs
)
_generate_msg_lisp(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection_msgs
)
_generate_msg_lisp(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3DArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/LaserScan.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection_msgs
)
_generate_msg_lisp(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection_msgs
)
_generate_msg_lisp(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3DArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/LaserScan.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection_msgs
)
_generate_msg_lisp(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/StringArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection_msgs
)

### Generating Services
_generate_srv_lisp(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/srv/Detection2DTrig.srv"
  "${MSG_I_FLAGS}"
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Detection2D.msg;/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection_msgs
)

### Generating Module File
_generate_module_lisp(detection_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(detection_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(detection_msgs_generate_messages detection_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_lisp _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Detection2D.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_lisp _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3D.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_lisp _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3DArray.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_lisp _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3D.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_lisp _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3DArray.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_lisp _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/StringArray.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_lisp _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/srv/Detection2DTrig.srv" NAME_WE)
add_dependencies(detection_msgs_generate_messages_lisp _detection_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(detection_msgs_genlisp)
add_dependencies(detection_msgs_genlisp detection_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS detection_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection_msgs
)
_generate_msg_nodejs(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Detection2D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection_msgs
)
_generate_msg_nodejs(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection_msgs
)
_generate_msg_nodejs(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3DArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/LaserScan.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection_msgs
)
_generate_msg_nodejs(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection_msgs
)
_generate_msg_nodejs(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3DArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/LaserScan.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection_msgs
)
_generate_msg_nodejs(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/StringArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection_msgs
)

### Generating Services
_generate_srv_nodejs(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/srv/Detection2DTrig.srv"
  "${MSG_I_FLAGS}"
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Detection2D.msg;/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection_msgs
)

### Generating Module File
_generate_module_nodejs(detection_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(detection_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(detection_msgs_generate_messages detection_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_nodejs _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Detection2D.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_nodejs _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3D.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_nodejs _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3DArray.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_nodejs _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3D.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_nodejs _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3DArray.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_nodejs _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/StringArray.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_nodejs _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/srv/Detection2DTrig.srv" NAME_WE)
add_dependencies(detection_msgs_generate_messages_nodejs _detection_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(detection_msgs_gennodejs)
add_dependencies(detection_msgs_gennodejs detection_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS detection_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection_msgs
)
_generate_msg_py(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Detection2D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection_msgs
)
_generate_msg_py(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection_msgs
)
_generate_msg_py(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3DArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/LaserScan.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection_msgs
)
_generate_msg_py(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection_msgs
)
_generate_msg_py(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3DArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/LaserScan.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection_msgs
)
_generate_msg_py(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/StringArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection_msgs
)

### Generating Services
_generate_srv_py(detection_msgs
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/srv/Detection2DTrig.srv"
  "${MSG_I_FLAGS}"
  "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Detection2D.msg;/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection_msgs
)

### Generating Module File
_generate_module_py(detection_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(detection_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(detection_msgs_generate_messages detection_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/BBox2D.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_py _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Detection2D.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_py _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3D.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_py _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Det3DArray.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_py _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3D.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_py _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/Track3DArray.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_py _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/msg/StringArray.msg" NAME_WE)
add_dependencies(detection_msgs_generate_messages_py _detection_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/developer/master_ws/master_robot/mars_ws/src/detection_msgs/srv/Detection2DTrig.srv" NAME_WE)
add_dependencies(detection_msgs_generate_messages_py _detection_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(detection_msgs_genpy)
add_dependencies(detection_msgs_genpy detection_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS detection_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/detection_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(detection_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(detection_msgs_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(detection_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(detection_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET visualization_msgs_generate_messages_cpp)
  add_dependencies(detection_msgs_generate_messages_cpp visualization_msgs_generate_messages_cpp)
endif()
if(TARGET detection_msgs_generate_messages_cpp)
  add_dependencies(detection_msgs_generate_messages_cpp detection_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/detection_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(detection_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(detection_msgs_generate_messages_eus nav_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(detection_msgs_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(detection_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET visualization_msgs_generate_messages_eus)
  add_dependencies(detection_msgs_generate_messages_eus visualization_msgs_generate_messages_eus)
endif()
if(TARGET detection_msgs_generate_messages_eus)
  add_dependencies(detection_msgs_generate_messages_eus detection_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/detection_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(detection_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(detection_msgs_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(detection_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(detection_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET visualization_msgs_generate_messages_lisp)
  add_dependencies(detection_msgs_generate_messages_lisp visualization_msgs_generate_messages_lisp)
endif()
if(TARGET detection_msgs_generate_messages_lisp)
  add_dependencies(detection_msgs_generate_messages_lisp detection_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/detection_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(detection_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(detection_msgs_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(detection_msgs_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(detection_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET visualization_msgs_generate_messages_nodejs)
  add_dependencies(detection_msgs_generate_messages_nodejs visualization_msgs_generate_messages_nodejs)
endif()
if(TARGET detection_msgs_generate_messages_nodejs)
  add_dependencies(detection_msgs_generate_messages_nodejs detection_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/detection_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(detection_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(detection_msgs_generate_messages_py nav_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(detection_msgs_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(detection_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET visualization_msgs_generate_messages_py)
  add_dependencies(detection_msgs_generate_messages_py visualization_msgs_generate_messages_py)
endif()
if(TARGET detection_msgs_generate_messages_py)
  add_dependencies(detection_msgs_generate_messages_py detection_msgs_generate_messages_py)
endif()
