;; Auto-generated. Do not edit!


(when (boundp 'pedsim_msgs::GymAgentInfo)
  (if (not (find-package "PEDSIM_MSGS"))
    (make-package "PEDSIM_MSGS"))
  (shadow 'GymAgentInfo (find-package "PEDSIM_MSGS")))
(unless (find-package "PEDSIM_MSGS::GYMAGENTINFO")
  (make-package "PEDSIM_MSGS::GYMAGENTINFO"))

(in-package "ROS")
;;//! \htmlinclude GymAgentInfo.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass pedsim_msgs::GymAgentInfo
  :super ros::object
  :slots (_init_pose2d _waypoints_list ))

(defmethod pedsim_msgs::GymAgentInfo
  (:init
   (&key
    ((:init_pose2d __init_pose2d) (instance geometry_msgs::Pose2D :init))
    ((:waypoints_list __waypoints_list) ())
    )
   (send-super :init)
   (setq _init_pose2d __init_pose2d)
   (setq _waypoints_list __waypoints_list)
   self)
  (:init_pose2d
   (&rest __init_pose2d)
   (if (keywordp (car __init_pose2d))
       (send* _init_pose2d __init_pose2d)
     (progn
       (if __init_pose2d (setq _init_pose2d (car __init_pose2d)))
       _init_pose2d)))
  (:waypoints_list
   (&rest __waypoints_list)
   (if (keywordp (car __waypoints_list))
       (send* _waypoints_list __waypoints_list)
     (progn
       (if __waypoints_list (setq _waypoints_list (car __waypoints_list)))
       _waypoints_list)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose2D _init_pose2d
    (send _init_pose2d :serialization-length)
    ;; geometry_msgs/Pose2D[] _waypoints_list
    (apply #'+ (send-all _waypoints_list :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose2D _init_pose2d
       (send _init_pose2d :serialize s)
     ;; geometry_msgs/Pose2D[] _waypoints_list
     (write-long (length _waypoints_list) s)
     (dolist (elem _waypoints_list)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose2D _init_pose2d
     (send _init_pose2d :deserialize buf ptr-) (incf ptr- (send _init_pose2d :serialization-length))
   ;; geometry_msgs/Pose2D[] _waypoints_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _waypoints_list (let (r) (dotimes (i n) (push (instance geometry_msgs::Pose2D :init) r)) r))
     (dolist (elem- _waypoints_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get pedsim_msgs::GymAgentInfo :md5sum-) "7c16d0b53f72a3ed400f25f621b18ae2")
(setf (get pedsim_msgs::GymAgentInfo :datatype-) "pedsim_msgs/GymAgentInfo")
(setf (get pedsim_msgs::GymAgentInfo :definition-)
      "geometry_msgs/Pose2D    init_pose2d
geometry_msgs/Pose2D[]  waypoints_list
================================================================================
MSG: geometry_msgs/Pose2D
# Deprecated
# Please use the full 3D pose.

# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.

# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.


# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta

")



(provide :pedsim_msgs/GymAgentInfo "7c16d0b53f72a3ed400f25f621b18ae2")


