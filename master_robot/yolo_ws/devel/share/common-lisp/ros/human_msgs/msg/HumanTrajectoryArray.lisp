; Auto-generated. Do not edit!


(cl:in-package human_msgs-msg)


;//! \htmlinclude HumanTrajectoryArray.msg.html

(cl:defclass <HumanTrajectoryArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (trajectories
    :reader trajectories
    :initarg :trajectories
    :type (cl:vector human_msgs-msg:HumanTrajectory)
   :initform (cl:make-array 0 :element-type 'human_msgs-msg:HumanTrajectory :initial-element (cl:make-instance 'human_msgs-msg:HumanTrajectory))))
)

(cl:defclass HumanTrajectoryArray (<HumanTrajectoryArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HumanTrajectoryArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HumanTrajectoryArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name human_msgs-msg:<HumanTrajectoryArray> is deprecated: use human_msgs-msg:HumanTrajectoryArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <HumanTrajectoryArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_msgs-msg:header-val is deprecated.  Use human_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'trajectories-val :lambda-list '(m))
(cl:defmethod trajectories-val ((m <HumanTrajectoryArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_msgs-msg:trajectories-val is deprecated.  Use human_msgs-msg:trajectories instead.")
  (trajectories m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HumanTrajectoryArray>) ostream)
  "Serializes a message object of type '<HumanTrajectoryArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'trajectories))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'trajectories))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HumanTrajectoryArray>) istream)
  "Deserializes a message object of type '<HumanTrajectoryArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'trajectories) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'trajectories)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'human_msgs-msg:HumanTrajectory))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HumanTrajectoryArray>)))
  "Returns string type for a message object of type '<HumanTrajectoryArray>"
  "human_msgs/HumanTrajectoryArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HumanTrajectoryArray)))
  "Returns string type for a message object of type 'HumanTrajectoryArray"
  "human_msgs/HumanTrajectoryArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HumanTrajectoryArray>)))
  "Returns md5sum for a message object of type '<HumanTrajectoryArray>"
  "5ad8c3c6ea66cb744a1fc37739b7074e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HumanTrajectoryArray)))
  "Returns md5sum for a message object of type 'HumanTrajectoryArray"
  "5ad8c3c6ea66cb744a1fc37739b7074e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HumanTrajectoryArray>)))
  "Returns full string definition for message of type '<HumanTrajectoryArray>"
  (cl:format cl:nil "std_msgs/Header             header~%human_msgs/HumanTrajectory[] trajectories~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: human_msgs/HumanTrajectory~%std_msgs/Header         header~%uint64                  id~%human_msgs/Trajectory    trajectory~%~%================================================================================~%MSG: human_msgs/Trajectory~%std_msgs/Header                 header~%human_msgs/TrajectoryPoint[]     points~%~%================================================================================~%MSG: human_msgs/TrajectoryPoint~%geometry_msgs/Transform     transform~%geometry_msgs/Twist         velocity~%geometry_msgs/Twist         acceleration~%duration                    time_from_start~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HumanTrajectoryArray)))
  "Returns full string definition for message of type 'HumanTrajectoryArray"
  (cl:format cl:nil "std_msgs/Header             header~%human_msgs/HumanTrajectory[] trajectories~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: human_msgs/HumanTrajectory~%std_msgs/Header         header~%uint64                  id~%human_msgs/Trajectory    trajectory~%~%================================================================================~%MSG: human_msgs/Trajectory~%std_msgs/Header                 header~%human_msgs/TrajectoryPoint[]     points~%~%================================================================================~%MSG: human_msgs/TrajectoryPoint~%geometry_msgs/Transform     transform~%geometry_msgs/Twist         velocity~%geometry_msgs/Twist         acceleration~%duration                    time_from_start~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HumanTrajectoryArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'trajectories) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HumanTrajectoryArray>))
  "Converts a ROS message object to a list"
  (cl:list 'HumanTrajectoryArray
    (cl:cons ':header (header msg))
    (cl:cons ':trajectories (trajectories msg))
))
