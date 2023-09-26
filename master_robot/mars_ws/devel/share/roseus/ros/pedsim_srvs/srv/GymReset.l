;; Auto-generated. Do not edit!


(when (boundp 'pedsim_srvs::GymReset)
  (if (not (find-package "PEDSIM_SRVS"))
    (make-package "PEDSIM_SRVS"))
  (shadow 'GymReset (find-package "PEDSIM_SRVS")))
(unless (find-package "PEDSIM_SRVS::GYMRESET")
  (make-package "PEDSIM_SRVS::GYMRESET"))
(unless (find-package "PEDSIM_SRVS::GYMRESETREQUEST")
  (make-package "PEDSIM_SRVS::GYMRESETREQUEST"))
(unless (find-package "PEDSIM_SRVS::GYMRESETRESPONSE")
  (make-package "PEDSIM_SRVS::GYMRESETRESPONSE"))

(in-package "ROS")

(if (not (find-package "PEDSIM_MSGS"))
  (ros::roseus-add-msgs "pedsim_msgs"))




(defclass pedsim_srvs::GymResetRequest
  :super ros::object
  :slots (_agents_list ))

(defmethod pedsim_srvs::GymResetRequest
  (:init
   (&key
    ((:agents_list __agents_list) ())
    )
   (send-super :init)
   (setq _agents_list __agents_list)
   self)
  (:agents_list
   (&rest __agents_list)
   (if (keywordp (car __agents_list))
       (send* _agents_list __agents_list)
     (progn
       (if __agents_list (setq _agents_list (car __agents_list)))
       _agents_list)))
  (:serialization-length
   ()
   (+
    ;; pedsim_msgs/GymAgentInfo[] _agents_list
    (apply #'+ (send-all _agents_list :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; pedsim_msgs/GymAgentInfo[] _agents_list
     (write-long (length _agents_list) s)
     (dolist (elem _agents_list)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; pedsim_msgs/GymAgentInfo[] _agents_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _agents_list (let (r) (dotimes (i n) (push (instance pedsim_msgs::GymAgentInfo :init) r)) r))
     (dolist (elem- _agents_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass pedsim_srvs::GymResetResponse
  :super ros::object
  :slots (_success ))

(defmethod pedsim_srvs::GymResetResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass pedsim_srvs::GymReset
  :super ros::object
  :slots ())

(setf (get pedsim_srvs::GymReset :md5sum-) "a97915fd01741ae65f8ce47a0e7cc85c")
(setf (get pedsim_srvs::GymReset :datatype-) "pedsim_srvs/GymReset")
(setf (get pedsim_srvs::GymReset :request) pedsim_srvs::GymResetRequest)
(setf (get pedsim_srvs::GymReset :response) pedsim_srvs::GymResetResponse)

(defmethod pedsim_srvs::GymResetRequest
  (:response () (instance pedsim_srvs::GymResetResponse :init)))

(setf (get pedsim_srvs::GymResetRequest :md5sum-) "a97915fd01741ae65f8ce47a0e7cc85c")
(setf (get pedsim_srvs::GymResetRequest :datatype-) "pedsim_srvs/GymResetRequest")
(setf (get pedsim_srvs::GymResetRequest :definition-)
      "pedsim_msgs/GymAgentInfo[] agents_list

================================================================================
MSG: pedsim_msgs/GymAgentInfo
geometry_msgs/Pose2D    init_pose2d
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
---
bool success
")

(setf (get pedsim_srvs::GymResetResponse :md5sum-) "a97915fd01741ae65f8ce47a0e7cc85c")
(setf (get pedsim_srvs::GymResetResponse :datatype-) "pedsim_srvs/GymResetResponse")
(setf (get pedsim_srvs::GymResetResponse :definition-)
      "pedsim_msgs/GymAgentInfo[] agents_list

================================================================================
MSG: pedsim_msgs/GymAgentInfo
geometry_msgs/Pose2D    init_pose2d
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
---
bool success
")



(provide :pedsim_srvs/GymReset "a97915fd01741ae65f8ce47a0e7cc85c")


