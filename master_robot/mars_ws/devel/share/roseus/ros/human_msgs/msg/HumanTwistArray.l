;; Auto-generated. Do not edit!


(when (boundp 'human_msgs::HumanTwistArray)
  (if (not (find-package "HUMAN_MSGS"))
    (make-package "HUMAN_MSGS"))
  (shadow 'HumanTwistArray (find-package "HUMAN_MSGS")))
(unless (find-package "HUMAN_MSGS::HUMANTWISTARRAY")
  (make-package "HUMAN_MSGS::HUMANTWISTARRAY"))

(in-package "ROS")
;;//! \htmlinclude HumanTwistArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass human_msgs::HumanTwistArray
  :super ros::object
  :slots (_header _twists ))

(defmethod human_msgs::HumanTwistArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:twists __twists) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _twists __twists)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:twists
   (&rest __twists)
   (if (keywordp (car __twists))
       (send* _twists __twists)
     (progn
       (if __twists (setq _twists (car __twists)))
       _twists)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; human_msgs/HumanTwist[] _twists
    (apply #'+ (send-all _twists :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; human_msgs/HumanTwist[] _twists
     (write-long (length _twists) s)
     (dolist (elem _twists)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; human_msgs/HumanTwist[] _twists
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _twists (let (r) (dotimes (i n) (push (instance human_msgs::HumanTwist :init) r)) r))
     (dolist (elem- _twists)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get human_msgs::HumanTwistArray :md5sum-) "07265c7c8f0288cacbbba8ea359ddf7f")
(setf (get human_msgs::HumanTwistArray :datatype-) "human_msgs/HumanTwistArray")
(setf (get human_msgs::HumanTwistArray :definition-)
      "std_msgs/Header header
HumanTwist[]    twists

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: human_msgs/HumanTwist
uint64              id
geometry_msgs/Twist twist

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :human_msgs/HumanTwistArray "07265c7c8f0288cacbbba8ea359ddf7f")


