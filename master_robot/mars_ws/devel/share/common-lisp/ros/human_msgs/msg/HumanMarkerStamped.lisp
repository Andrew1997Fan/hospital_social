; Auto-generated. Do not edit!


(cl:in-package human_msgs-msg)


;//! \htmlinclude HumanMarkerStamped.msg.html

(cl:defclass <HumanMarkerStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (human
    :reader human
    :initarg :human
    :type human_msgs-msg:HumanMarker
    :initform (cl:make-instance 'human_msgs-msg:HumanMarker)))
)

(cl:defclass HumanMarkerStamped (<HumanMarkerStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HumanMarkerStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HumanMarkerStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name human_msgs-msg:<HumanMarkerStamped> is deprecated: use human_msgs-msg:HumanMarkerStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <HumanMarkerStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_msgs-msg:header-val is deprecated.  Use human_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'human-val :lambda-list '(m))
(cl:defmethod human-val ((m <HumanMarkerStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_msgs-msg:human-val is deprecated.  Use human_msgs-msg:human instead.")
  (human m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HumanMarkerStamped>) ostream)
  "Serializes a message object of type '<HumanMarkerStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'human) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HumanMarkerStamped>) istream)
  "Deserializes a message object of type '<HumanMarkerStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'human) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HumanMarkerStamped>)))
  "Returns string type for a message object of type '<HumanMarkerStamped>"
  "human_msgs/HumanMarkerStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HumanMarkerStamped)))
  "Returns string type for a message object of type 'HumanMarkerStamped"
  "human_msgs/HumanMarkerStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HumanMarkerStamped>)))
  "Returns md5sum for a message object of type '<HumanMarkerStamped>"
  "e4b954e663bdc578b9f1e5ff75a0b1c7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HumanMarkerStamped)))
  "Returns md5sum for a message object of type 'HumanMarkerStamped"
  "e4b954e663bdc578b9f1e5ff75a0b1c7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HumanMarkerStamped>)))
  "Returns full string definition for message of type '<HumanMarkerStamped>"
  (cl:format cl:nil "Header        header~%HumanMarker   human         ~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: human_msgs/HumanMarker~%uint64              id~%bool                active~%geometry_msgs/Pose  pose~%geometry_msgs/Twist velocity~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HumanMarkerStamped)))
  "Returns full string definition for message of type 'HumanMarkerStamped"
  (cl:format cl:nil "Header        header~%HumanMarker   human         ~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: human_msgs/HumanMarker~%uint64              id~%bool                active~%geometry_msgs/Pose  pose~%geometry_msgs/Twist velocity~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HumanMarkerStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'human))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HumanMarkerStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'HumanMarkerStamped
    (cl:cons ':header (header msg))
    (cl:cons ':human (human msg))
))
