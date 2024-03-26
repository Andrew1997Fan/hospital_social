; Auto-generated. Do not edit!


(cl:in-package human_msgs-msg)


;//! \htmlinclude TimeToGoal.msg.html

(cl:defclass <TimeToGoal> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (time_to_goal
    :reader time_to_goal
    :initarg :time_to_goal
    :type cl:real
    :initform 0))
)

(cl:defclass TimeToGoal (<TimeToGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TimeToGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TimeToGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name human_msgs-msg:<TimeToGoal> is deprecated: use human_msgs-msg:TimeToGoal instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <TimeToGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_msgs-msg:header-val is deprecated.  Use human_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'time_to_goal-val :lambda-list '(m))
(cl:defmethod time_to_goal-val ((m <TimeToGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_msgs-msg:time_to_goal-val is deprecated.  Use human_msgs-msg:time_to_goal instead.")
  (time_to_goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TimeToGoal>) ostream)
  "Serializes a message object of type '<TimeToGoal>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'time_to_goal)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'time_to_goal) (cl:floor (cl:slot-value msg 'time_to_goal)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TimeToGoal>) istream)
  "Deserializes a message object of type '<TimeToGoal>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'time_to_goal) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TimeToGoal>)))
  "Returns string type for a message object of type '<TimeToGoal>"
  "human_msgs/TimeToGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TimeToGoal)))
  "Returns string type for a message object of type 'TimeToGoal"
  "human_msgs/TimeToGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TimeToGoal>)))
  "Returns md5sum for a message object of type '<TimeToGoal>"
  "4da11369ff2f4aca8781b81eb5041b58")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TimeToGoal)))
  "Returns md5sum for a message object of type 'TimeToGoal"
  "4da11369ff2f4aca8781b81eb5041b58")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TimeToGoal>)))
  "Returns full string definition for message of type '<TimeToGoal>"
  (cl:format cl:nil "std_msgs/Header header~%duration        time_to_goal~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TimeToGoal)))
  "Returns full string definition for message of type 'TimeToGoal"
  (cl:format cl:nil "std_msgs/Header header~%duration        time_to_goal~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TimeToGoal>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TimeToGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'TimeToGoal
    (cl:cons ':header (header msg))
    (cl:cons ':time_to_goal (time_to_goal msg))
))
