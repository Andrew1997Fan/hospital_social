; Auto-generated. Do not edit!


(cl:in-package pedsim_srvs-srv)


;//! \htmlinclude GymReset-request.msg.html

(cl:defclass <GymReset-request> (roslisp-msg-protocol:ros-message)
  ((agents_list
    :reader agents_list
    :initarg :agents_list
    :type (cl:vector pedsim_msgs-msg:GymAgentInfo)
   :initform (cl:make-array 0 :element-type 'pedsim_msgs-msg:GymAgentInfo :initial-element (cl:make-instance 'pedsim_msgs-msg:GymAgentInfo))))
)

(cl:defclass GymReset-request (<GymReset-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GymReset-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GymReset-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pedsim_srvs-srv:<GymReset-request> is deprecated: use pedsim_srvs-srv:GymReset-request instead.")))

(cl:ensure-generic-function 'agents_list-val :lambda-list '(m))
(cl:defmethod agents_list-val ((m <GymReset-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pedsim_srvs-srv:agents_list-val is deprecated.  Use pedsim_srvs-srv:agents_list instead.")
  (agents_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GymReset-request>) ostream)
  "Serializes a message object of type '<GymReset-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'agents_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'agents_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GymReset-request>) istream)
  "Deserializes a message object of type '<GymReset-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'agents_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'agents_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'pedsim_msgs-msg:GymAgentInfo))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GymReset-request>)))
  "Returns string type for a service object of type '<GymReset-request>"
  "pedsim_srvs/GymResetRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GymReset-request)))
  "Returns string type for a service object of type 'GymReset-request"
  "pedsim_srvs/GymResetRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GymReset-request>)))
  "Returns md5sum for a message object of type '<GymReset-request>"
  "a97915fd01741ae65f8ce47a0e7cc85c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GymReset-request)))
  "Returns md5sum for a message object of type 'GymReset-request"
  "a97915fd01741ae65f8ce47a0e7cc85c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GymReset-request>)))
  "Returns full string definition for message of type '<GymReset-request>"
  (cl:format cl:nil "pedsim_msgs/GymAgentInfo[] agents_list~%~%================================================================================~%MSG: pedsim_msgs/GymAgentInfo~%geometry_msgs/Pose2D    init_pose2d~%geometry_msgs/Pose2D[]  waypoints_list~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GymReset-request)))
  "Returns full string definition for message of type 'GymReset-request"
  (cl:format cl:nil "pedsim_msgs/GymAgentInfo[] agents_list~%~%================================================================================~%MSG: pedsim_msgs/GymAgentInfo~%geometry_msgs/Pose2D    init_pose2d~%geometry_msgs/Pose2D[]  waypoints_list~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GymReset-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'agents_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GymReset-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GymReset-request
    (cl:cons ':agents_list (agents_list msg))
))
;//! \htmlinclude GymReset-response.msg.html

(cl:defclass <GymReset-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GymReset-response (<GymReset-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GymReset-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GymReset-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pedsim_srvs-srv:<GymReset-response> is deprecated: use pedsim_srvs-srv:GymReset-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GymReset-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pedsim_srvs-srv:success-val is deprecated.  Use pedsim_srvs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GymReset-response>) ostream)
  "Serializes a message object of type '<GymReset-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GymReset-response>) istream)
  "Deserializes a message object of type '<GymReset-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GymReset-response>)))
  "Returns string type for a service object of type '<GymReset-response>"
  "pedsim_srvs/GymResetResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GymReset-response)))
  "Returns string type for a service object of type 'GymReset-response"
  "pedsim_srvs/GymResetResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GymReset-response>)))
  "Returns md5sum for a message object of type '<GymReset-response>"
  "a97915fd01741ae65f8ce47a0e7cc85c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GymReset-response)))
  "Returns md5sum for a message object of type 'GymReset-response"
  "a97915fd01741ae65f8ce47a0e7cc85c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GymReset-response>)))
  "Returns full string definition for message of type '<GymReset-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GymReset-response)))
  "Returns full string definition for message of type 'GymReset-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GymReset-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GymReset-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GymReset-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GymReset)))
  'GymReset-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GymReset)))
  'GymReset-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GymReset)))
  "Returns string type for a service object of type '<GymReset>"
  "pedsim_srvs/GymReset")