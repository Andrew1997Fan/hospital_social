;; Auto-generated. Do not edit!


(when (boundp 'human_msgs::HumanMarkerStamped)
  (if (not (find-package "HUMAN_MSGS"))
    (make-package "HUMAN_MSGS"))
  (shadow 'HumanMarkerStamped (find-package "HUMAN_MSGS")))
(unless (find-package "HUMAN_MSGS::HUMANMARKERSTAMPED")
  (make-package "HUMAN_MSGS::HUMANMARKERSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude HumanMarkerStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass human_msgs::HumanMarkerStamped
  :super ros::object
  :slots (_header _human ))

(defmethod human_msgs::HumanMarkerStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:human __human) (instance human_msgs::HumanMarker :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _human __human)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:human
   (&rest __human)
   (if (keywordp (car __human))
       (send* _human __human)
     (progn
       (if __human (setq _human (car __human)))
       _human)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; human_msgs/HumanMarker _human
    (send _human :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; human_msgs/HumanMarker _human
       (send _human :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; human_msgs/HumanMarker _human
     (send _human :deserialize buf ptr-) (incf ptr- (send _human :serialization-length))
   ;;
   self)
  )

(setf (get human_msgs::HumanMarkerStamped :md5sum-) "e4b954e663bdc578b9f1e5ff75a0b1c7")
(setf (get human_msgs::HumanMarkerStamped :datatype-) "human_msgs/HumanMarkerStamped")
(setf (get human_msgs::HumanMarkerStamped :definition-)
      "Header        header
HumanMarker   human         

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
MSG: human_msgs/HumanMarker
uint64              id
bool                active
geometry_msgs/Pose  pose
geometry_msgs/Twist velocity

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

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



(provide :human_msgs/HumanMarkerStamped "e4b954e663bdc578b9f1e5ff75a0b1c7")


