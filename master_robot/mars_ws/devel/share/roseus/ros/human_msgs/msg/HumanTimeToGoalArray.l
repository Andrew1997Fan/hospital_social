;; Auto-generated. Do not edit!


(when (boundp 'human_msgs::HumanTimeToGoalArray)
  (if (not (find-package "HUMAN_MSGS"))
    (make-package "HUMAN_MSGS"))
  (shadow 'HumanTimeToGoalArray (find-package "HUMAN_MSGS")))
(unless (find-package "HUMAN_MSGS::HUMANTIMETOGOALARRAY")
  (make-package "HUMAN_MSGS::HUMANTIMETOGOALARRAY"))

(in-package "ROS")
;;//! \htmlinclude HumanTimeToGoalArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass human_msgs::HumanTimeToGoalArray
  :super ros::object
  :slots (_header _times_to_goal ))

(defmethod human_msgs::HumanTimeToGoalArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:times_to_goal __times_to_goal) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _times_to_goal __times_to_goal)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:times_to_goal
   (&rest __times_to_goal)
   (if (keywordp (car __times_to_goal))
       (send* _times_to_goal __times_to_goal)
     (progn
       (if __times_to_goal (setq _times_to_goal (car __times_to_goal)))
       _times_to_goal)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; human_msgs/HumanTimeToGoal[] _times_to_goal
    (apply #'+ (send-all _times_to_goal :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; human_msgs/HumanTimeToGoal[] _times_to_goal
     (write-long (length _times_to_goal) s)
     (dolist (elem _times_to_goal)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; human_msgs/HumanTimeToGoal[] _times_to_goal
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _times_to_goal (let (r) (dotimes (i n) (push (instance human_msgs::HumanTimeToGoal :init) r)) r))
     (dolist (elem- _times_to_goal)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get human_msgs::HumanTimeToGoalArray :md5sum-) "6ede5186f8390c247effec1c7d29fe0f")
(setf (get human_msgs::HumanTimeToGoalArray :datatype-) "human_msgs/HumanTimeToGoalArray")
(setf (get human_msgs::HumanTimeToGoalArray :definition-)
      "std_msgs/Header             header
human_msgs/HumanTimeToGoal[] times_to_goal

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
MSG: human_msgs/HumanTimeToGoal
std_msgs/Header header
uint64          id
duration        time_to_goal

")



(provide :human_msgs/HumanTimeToGoalArray "6ede5186f8390c247effec1c7d29fe0f")


