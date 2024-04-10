;; Auto-generated. Do not edit!


(when (boundp 'human_msgs::TimeToGoal)
  (if (not (find-package "HUMAN_MSGS"))
    (make-package "HUMAN_MSGS"))
  (shadow 'TimeToGoal (find-package "HUMAN_MSGS")))
(unless (find-package "HUMAN_MSGS::TIMETOGOAL")
  (make-package "HUMAN_MSGS::TIMETOGOAL"))

(in-package "ROS")
;;//! \htmlinclude TimeToGoal.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass human_msgs::TimeToGoal
  :super ros::object
  :slots (_header _time_to_goal ))

(defmethod human_msgs::TimeToGoal
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:time_to_goal __time_to_goal) (instance ros::time :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _time_to_goal __time_to_goal)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:time_to_goal
   (&optional __time_to_goal)
   (if __time_to_goal (setq _time_to_goal __time_to_goal)) _time_to_goal)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; duration _time_to_goal
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; duration _time_to_goal
       (write-long (send _time_to_goal :sec) s) (write-long (send _time_to_goal :nsec) s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; duration _time_to_goal
     (send _time_to_goal :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _time_to_goal :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get human_msgs::TimeToGoal :md5sum-) "4da11369ff2f4aca8781b81eb5041b58")
(setf (get human_msgs::TimeToGoal :datatype-) "human_msgs/TimeToGoal")
(setf (get human_msgs::TimeToGoal :definition-)
      "std_msgs/Header header
duration        time_to_goal
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

")



(provide :human_msgs/TimeToGoal "4da11369ff2f4aca8781b81eb5041b58")


