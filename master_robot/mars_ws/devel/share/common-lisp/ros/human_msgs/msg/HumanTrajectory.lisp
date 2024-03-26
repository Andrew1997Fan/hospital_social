; Auto-generated. Do not edit!


(cl:in-package human_msgs-msg)


;//! \htmlinclude HumanTrajectory.msg.html

(cl:defclass <HumanTrajectory> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (trajectory
    :reader trajectory
    :initarg :trajectory
    :type human_msgs-msg:Trajectory
    :initform (cl:make-instance 'human_msgs-msg:Trajectory)))
)

(cl:defclass HumanTrajectory (<HumanTrajectory>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HumanTrajectory>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HumanTrajectory)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name human_msgs-msg:<HumanTrajectory> is deprecated: use human_msgs-msg:HumanTrajectory instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <HumanTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_msgs-msg:header-val is deprecated.  Use human_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <HumanTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_msgs-msg:id-val is deprecated.  Use human_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'trajectory-val :lambda-list '(m))
(cl:defmethod trajectory-val ((m <HumanTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_msgs-msg:trajectory-val is deprecated.  Use human_msgs-msg:trajectory instead.")
  (trajectory m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HumanTrajectory>) ostream)
  "Serializes a message object of type '<HumanTrajectory>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'id)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'trajectory) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HumanTrajectory>) istream)
  "Deserializes a message object of type '<HumanTrajectory>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'id)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'trajectory) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HumanTrajectory>)))
  "Returns string type for a message object of type '<HumanTrajectory>"
  "human_msgs/HumanTrajectory")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HumanTrajectory)))
  "Returns string type for a message object of type 'HumanTrajectory"
  "human_msgs/HumanTrajectory")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HumanTrajectory>)))
  "Returns md5sum for a message object of type '<HumanTrajectory>"
  "6538ddd389c59bb2846784738d9cb859")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HumanTrajectory)))
  "Returns md5sum for a message object of type 'HumanTrajectory"
  "6538ddd389c59bb2846784738d9cb859")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HumanTrajectory>)))
  "Returns full string definition for message of type '<HumanTrajectory>"
  (cl:format cl:nil "std_msgs/Header         header~%uint64                  id~%human_msgs/Trajectory    trajectory~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: human_msgs/Trajectory~%std_msgs/Header                 header~%human_msgs/TrajectoryPoint[]     points~%~%================================================================================~%MSG: human_msgs/TrajectoryPoint~%geometry_msgs/Transform     transform~%geometry_msgs/Twist         velocity~%geometry_msgs/Twist         acceleration~%duration                    time_from_start~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HumanTrajectory)))
  "Returns full string definition for message of type 'HumanTrajectory"
  (cl:format cl:nil "std_msgs/Header         header~%uint64                  id~%human_msgs/Trajectory    trajectory~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: human_msgs/Trajectory~%std_msgs/Header                 header~%human_msgs/TrajectoryPoint[]     points~%~%================================================================================~%MSG: human_msgs/TrajectoryPoint~%geometry_msgs/Transform     transform~%geometry_msgs/Twist         velocity~%geometry_msgs/Twist         acceleration~%duration                    time_from_start~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HumanTrajectory>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'trajectory))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HumanTrajectory>))
  "Converts a ROS message object to a list"
  (cl:list 'HumanTrajectory
    (cl:cons ':header (header msg))
    (cl:cons ':id (id msg))
    (cl:cons ':trajectory (trajectory msg))
))
