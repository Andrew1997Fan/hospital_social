; Auto-generated. Do not edit!


(cl:in-package pedsim_msgs-msg)


;//! \htmlinclude GymAgentInfo.msg.html

(cl:defclass <GymAgentInfo> (roslisp-msg-protocol:ros-message)
  ((init_pose2d
    :reader init_pose2d
    :initarg :init_pose2d
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D))
   (waypoints_list
    :reader waypoints_list
    :initarg :waypoints_list
    :type (cl:vector geometry_msgs-msg:Pose2D)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Pose2D :initial-element (cl:make-instance 'geometry_msgs-msg:Pose2D))))
)

(cl:defclass GymAgentInfo (<GymAgentInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GymAgentInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GymAgentInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pedsim_msgs-msg:<GymAgentInfo> is deprecated: use pedsim_msgs-msg:GymAgentInfo instead.")))

(cl:ensure-generic-function 'init_pose2d-val :lambda-list '(m))
(cl:defmethod init_pose2d-val ((m <GymAgentInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pedsim_msgs-msg:init_pose2d-val is deprecated.  Use pedsim_msgs-msg:init_pose2d instead.")
  (init_pose2d m))

(cl:ensure-generic-function 'waypoints_list-val :lambda-list '(m))
(cl:defmethod waypoints_list-val ((m <GymAgentInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pedsim_msgs-msg:waypoints_list-val is deprecated.  Use pedsim_msgs-msg:waypoints_list instead.")
  (waypoints_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GymAgentInfo>) ostream)
  "Serializes a message object of type '<GymAgentInfo>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'init_pose2d) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'waypoints_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'waypoints_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GymAgentInfo>) istream)
  "Deserializes a message object of type '<GymAgentInfo>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'init_pose2d) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'waypoints_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'waypoints_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Pose2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GymAgentInfo>)))
  "Returns string type for a message object of type '<GymAgentInfo>"
  "pedsim_msgs/GymAgentInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GymAgentInfo)))
  "Returns string type for a message object of type 'GymAgentInfo"
  "pedsim_msgs/GymAgentInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GymAgentInfo>)))
  "Returns md5sum for a message object of type '<GymAgentInfo>"
  "7c16d0b53f72a3ed400f25f621b18ae2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GymAgentInfo)))
  "Returns md5sum for a message object of type 'GymAgentInfo"
  "7c16d0b53f72a3ed400f25f621b18ae2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GymAgentInfo>)))
  "Returns full string definition for message of type '<GymAgentInfo>"
  (cl:format cl:nil "geometry_msgs/Pose2D    init_pose2d~%geometry_msgs/Pose2D[]  waypoints_list~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GymAgentInfo)))
  "Returns full string definition for message of type 'GymAgentInfo"
  (cl:format cl:nil "geometry_msgs/Pose2D    init_pose2d~%geometry_msgs/Pose2D[]  waypoints_list~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GymAgentInfo>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'init_pose2d))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'waypoints_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GymAgentInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'GymAgentInfo
    (cl:cons ':init_pose2d (init_pose2d msg))
    (cl:cons ':waypoints_list (waypoints_list msg))
))
