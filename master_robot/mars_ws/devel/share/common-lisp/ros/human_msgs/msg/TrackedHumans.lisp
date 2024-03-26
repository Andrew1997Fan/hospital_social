; Auto-generated. Do not edit!


(cl:in-package human_msgs-msg)


;//! \htmlinclude TrackedHumans.msg.html

(cl:defclass <TrackedHumans> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (humans
    :reader humans
    :initarg :humans
    :type (cl:vector human_msgs-msg:TrackedHuman)
   :initform (cl:make-array 0 :element-type 'human_msgs-msg:TrackedHuman :initial-element (cl:make-instance 'human_msgs-msg:TrackedHuman))))
)

(cl:defclass TrackedHumans (<TrackedHumans>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrackedHumans>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrackedHumans)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name human_msgs-msg:<TrackedHumans> is deprecated: use human_msgs-msg:TrackedHumans instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <TrackedHumans>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_msgs-msg:header-val is deprecated.  Use human_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'humans-val :lambda-list '(m))
(cl:defmethod humans-val ((m <TrackedHumans>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_msgs-msg:humans-val is deprecated.  Use human_msgs-msg:humans instead.")
  (humans m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrackedHumans>) ostream)
  "Serializes a message object of type '<TrackedHumans>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'humans))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'humans))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrackedHumans>) istream)
  "Deserializes a message object of type '<TrackedHumans>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'humans) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'humans)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'human_msgs-msg:TrackedHuman))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrackedHumans>)))
  "Returns string type for a message object of type '<TrackedHumans>"
  "human_msgs/TrackedHumans")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrackedHumans)))
  "Returns string type for a message object of type 'TrackedHumans"
  "human_msgs/TrackedHumans")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrackedHumans>)))
  "Returns md5sum for a message object of type '<TrackedHumans>"
  "ddb513d4fa77f778f04463ac24f9c5a4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrackedHumans)))
  "Returns md5sum for a message object of type 'TrackedHumans"
  "ddb513d4fa77f778f04463ac24f9c5a4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrackedHumans>)))
  "Returns full string definition for message of type '<TrackedHumans>"
  (cl:format cl:nil "Header              header~%TrackedHuman[]      humans~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: human_msgs/TrackedHuman~%# states~%int8 STATIC=0~%int8 MOVING=1~%int8 STOPPED=2~%int8 BLOCKED=3~%~%uint64              track_id~%int8                state~%TrackedSegment[]    segments~%~%================================================================================~%MSG: human_msgs/TrackedSegment~%int8                                type~%geometry_msgs/PoseWithCovariance    pose~%geometry_msgs/TwistWithCovariance   twist~%geometry_msgs/AccelWithCovariance   accel~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/TwistWithCovariance~%# This expresses velocity in free space with uncertainty.~%~%Twist twist~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/AccelWithCovariance~%# This expresses acceleration in free space with uncertainty.~%~%Accel accel~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Accel~%# This expresses acceleration in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrackedHumans)))
  "Returns full string definition for message of type 'TrackedHumans"
  (cl:format cl:nil "Header              header~%TrackedHuman[]      humans~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: human_msgs/TrackedHuman~%# states~%int8 STATIC=0~%int8 MOVING=1~%int8 STOPPED=2~%int8 BLOCKED=3~%~%uint64              track_id~%int8                state~%TrackedSegment[]    segments~%~%================================================================================~%MSG: human_msgs/TrackedSegment~%int8                                type~%geometry_msgs/PoseWithCovariance    pose~%geometry_msgs/TwistWithCovariance   twist~%geometry_msgs/AccelWithCovariance   accel~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/TwistWithCovariance~%# This expresses velocity in free space with uncertainty.~%~%Twist twist~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/AccelWithCovariance~%# This expresses acceleration in free space with uncertainty.~%~%Accel accel~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Accel~%# This expresses acceleration in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrackedHumans>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'humans) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrackedHumans>))
  "Converts a ROS message object to a list"
  (cl:list 'TrackedHumans
    (cl:cons ':header (header msg))
    (cl:cons ':humans (humans msg))
))
