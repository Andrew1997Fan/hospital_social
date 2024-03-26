; Auto-generated. Do not edit!


(cl:in-package human_msgs-msg)


;//! \htmlinclude HumanTimeToGoalArray.msg.html

(cl:defclass <HumanTimeToGoalArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (times_to_goal
    :reader times_to_goal
    :initarg :times_to_goal
    :type (cl:vector human_msgs-msg:HumanTimeToGoal)
   :initform (cl:make-array 0 :element-type 'human_msgs-msg:HumanTimeToGoal :initial-element (cl:make-instance 'human_msgs-msg:HumanTimeToGoal))))
)

(cl:defclass HumanTimeToGoalArray (<HumanTimeToGoalArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HumanTimeToGoalArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HumanTimeToGoalArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name human_msgs-msg:<HumanTimeToGoalArray> is deprecated: use human_msgs-msg:HumanTimeToGoalArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <HumanTimeToGoalArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_msgs-msg:header-val is deprecated.  Use human_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'times_to_goal-val :lambda-list '(m))
(cl:defmethod times_to_goal-val ((m <HumanTimeToGoalArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_msgs-msg:times_to_goal-val is deprecated.  Use human_msgs-msg:times_to_goal instead.")
  (times_to_goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HumanTimeToGoalArray>) ostream)
  "Serializes a message object of type '<HumanTimeToGoalArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'times_to_goal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'times_to_goal))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HumanTimeToGoalArray>) istream)
  "Deserializes a message object of type '<HumanTimeToGoalArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'times_to_goal) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'times_to_goal)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'human_msgs-msg:HumanTimeToGoal))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HumanTimeToGoalArray>)))
  "Returns string type for a message object of type '<HumanTimeToGoalArray>"
  "human_msgs/HumanTimeToGoalArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HumanTimeToGoalArray)))
  "Returns string type for a message object of type 'HumanTimeToGoalArray"
  "human_msgs/HumanTimeToGoalArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HumanTimeToGoalArray>)))
  "Returns md5sum for a message object of type '<HumanTimeToGoalArray>"
  "6ede5186f8390c247effec1c7d29fe0f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HumanTimeToGoalArray)))
  "Returns md5sum for a message object of type 'HumanTimeToGoalArray"
  "6ede5186f8390c247effec1c7d29fe0f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HumanTimeToGoalArray>)))
  "Returns full string definition for message of type '<HumanTimeToGoalArray>"
  (cl:format cl:nil "std_msgs/Header             header~%human_msgs/HumanTimeToGoal[] times_to_goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: human_msgs/HumanTimeToGoal~%std_msgs/Header header~%uint64          id~%duration        time_to_goal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HumanTimeToGoalArray)))
  "Returns full string definition for message of type 'HumanTimeToGoalArray"
  (cl:format cl:nil "std_msgs/Header             header~%human_msgs/HumanTimeToGoal[] times_to_goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: human_msgs/HumanTimeToGoal~%std_msgs/Header header~%uint64          id~%duration        time_to_goal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HumanTimeToGoalArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'times_to_goal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HumanTimeToGoalArray>))
  "Converts a ROS message object to a list"
  (cl:list 'HumanTimeToGoalArray
    (cl:cons ':header (header msg))
    (cl:cons ':times_to_goal (times_to_goal msg))
))
