; Auto-generated. Do not edit!


(cl:in-package human_msgs-msg)


;//! \htmlinclude TrackedHuman.msg.html

(cl:defclass <TrackedHuman> (roslisp-msg-protocol:ros-message)
  ((track_id
    :reader track_id
    :initarg :track_id
    :type cl:integer
    :initform 0)
   (state
    :reader state
    :initarg :state
    :type cl:fixnum
    :initform 0)
   (segments
    :reader segments
    :initarg :segments
    :type (cl:vector human_msgs-msg:TrackedSegment)
   :initform (cl:make-array 0 :element-type 'human_msgs-msg:TrackedSegment :initial-element (cl:make-instance 'human_msgs-msg:TrackedSegment))))
)

(cl:defclass TrackedHuman (<TrackedHuman>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrackedHuman>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrackedHuman)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name human_msgs-msg:<TrackedHuman> is deprecated: use human_msgs-msg:TrackedHuman instead.")))

(cl:ensure-generic-function 'track_id-val :lambda-list '(m))
(cl:defmethod track_id-val ((m <TrackedHuman>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_msgs-msg:track_id-val is deprecated.  Use human_msgs-msg:track_id instead.")
  (track_id m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <TrackedHuman>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_msgs-msg:state-val is deprecated.  Use human_msgs-msg:state instead.")
  (state m))

(cl:ensure-generic-function 'segments-val :lambda-list '(m))
(cl:defmethod segments-val ((m <TrackedHuman>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_msgs-msg:segments-val is deprecated.  Use human_msgs-msg:segments instead.")
  (segments m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<TrackedHuman>)))
    "Constants for message type '<TrackedHuman>"
  '((:STATIC . 0)
    (:MOVING . 1)
    (:STOPPED . 2)
    (:BLOCKED . 3))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'TrackedHuman)))
    "Constants for message type 'TrackedHuman"
  '((:STATIC . 0)
    (:MOVING . 1)
    (:STOPPED . 2)
    (:BLOCKED . 3))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrackedHuman>) ostream)
  "Serializes a message object of type '<TrackedHuman>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'track_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'track_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'track_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'track_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'track_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'track_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'track_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'track_id)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'segments))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'segments))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrackedHuman>) istream)
  "Deserializes a message object of type '<TrackedHuman>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'track_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'track_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'track_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'track_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'track_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'track_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'track_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'track_id)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'state) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'segments) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'segments)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'human_msgs-msg:TrackedSegment))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrackedHuman>)))
  "Returns string type for a message object of type '<TrackedHuman>"
  "human_msgs/TrackedHuman")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrackedHuman)))
  "Returns string type for a message object of type 'TrackedHuman"
  "human_msgs/TrackedHuman")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrackedHuman>)))
  "Returns md5sum for a message object of type '<TrackedHuman>"
  "6137b5ecce7d20cb2b1e3c938818307c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrackedHuman)))
  "Returns md5sum for a message object of type 'TrackedHuman"
  "6137b5ecce7d20cb2b1e3c938818307c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrackedHuman>)))
  "Returns full string definition for message of type '<TrackedHuman>"
  (cl:format cl:nil "# states~%int8 STATIC=0~%int8 MOVING=1~%int8 STOPPED=2~%int8 BLOCKED=3~%~%uint64              track_id~%int8                state~%TrackedSegment[]    segments~%~%================================================================================~%MSG: human_msgs/TrackedSegment~%int8                                type~%geometry_msgs/PoseWithCovariance    pose~%geometry_msgs/TwistWithCovariance   twist~%geometry_msgs/AccelWithCovariance   accel~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/TwistWithCovariance~%# This expresses velocity in free space with uncertainty.~%~%Twist twist~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/AccelWithCovariance~%# This expresses acceleration in free space with uncertainty.~%~%Accel accel~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Accel~%# This expresses acceleration in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrackedHuman)))
  "Returns full string definition for message of type 'TrackedHuman"
  (cl:format cl:nil "# states~%int8 STATIC=0~%int8 MOVING=1~%int8 STOPPED=2~%int8 BLOCKED=3~%~%uint64              track_id~%int8                state~%TrackedSegment[]    segments~%~%================================================================================~%MSG: human_msgs/TrackedSegment~%int8                                type~%geometry_msgs/PoseWithCovariance    pose~%geometry_msgs/TwistWithCovariance   twist~%geometry_msgs/AccelWithCovariance   accel~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/TwistWithCovariance~%# This expresses velocity in free space with uncertainty.~%~%Twist twist~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/AccelWithCovariance~%# This expresses acceleration in free space with uncertainty.~%~%Accel accel~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Accel~%# This expresses acceleration in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrackedHuman>))
  (cl:+ 0
     8
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'segments) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrackedHuman>))
  "Converts a ROS message object to a list"
  (cl:list 'TrackedHuman
    (cl:cons ':track_id (track_id msg))
    (cl:cons ':state (state msg))
    (cl:cons ':segments (segments msg))
))
