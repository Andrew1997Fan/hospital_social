;; Auto-generated. Do not edit!


(when (boundp 'human_msgs::TrajectoryPoint)
  (if (not (find-package "HUMAN_MSGS"))
    (make-package "HUMAN_MSGS"))
  (shadow 'TrajectoryPoint (find-package "HUMAN_MSGS")))
(unless (find-package "HUMAN_MSGS::TRAJECTORYPOINT")
  (make-package "HUMAN_MSGS::TRAJECTORYPOINT"))

(in-package "ROS")
;;//! \htmlinclude TrajectoryPoint.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass human_msgs::TrajectoryPoint
  :super ros::object
  :slots (_transform _velocity _acceleration _time_from_start ))

(defmethod human_msgs::TrajectoryPoint
  (:init
   (&key
    ((:transform __transform) (instance geometry_msgs::Transform :init))
    ((:velocity __velocity) (instance geometry_msgs::Twist :init))
    ((:acceleration __acceleration) (instance geometry_msgs::Twist :init))
    ((:time_from_start __time_from_start) (instance ros::time :init))
    )
   (send-super :init)
   (setq _transform __transform)
   (setq _velocity __velocity)
   (setq _acceleration __acceleration)
   (setq _time_from_start __time_from_start)
   self)
  (:transform
   (&rest __transform)
   (if (keywordp (car __transform))
       (send* _transform __transform)
     (progn
       (if __transform (setq _transform (car __transform)))
       _transform)))
  (:velocity
   (&rest __velocity)
   (if (keywordp (car __velocity))
       (send* _velocity __velocity)
     (progn
       (if __velocity (setq _velocity (car __velocity)))
       _velocity)))
  (:acceleration
   (&rest __acceleration)
   (if (keywordp (car __acceleration))
       (send* _acceleration __acceleration)
     (progn
       (if __acceleration (setq _acceleration (car __acceleration)))
       _acceleration)))
  (:time_from_start
   (&optional __time_from_start)
   (if __time_from_start (setq _time_from_start __time_from_start)) _time_from_start)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Transform _transform
    (send _transform :serialization-length)
    ;; geometry_msgs/Twist _velocity
    (send _velocity :serialization-length)
    ;; geometry_msgs/Twist _acceleration
    (send _acceleration :serialization-length)
    ;; duration _time_from_start
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Transform _transform
       (send _transform :serialize s)
     ;; geometry_msgs/Twist _velocity
       (send _velocity :serialize s)
     ;; geometry_msgs/Twist _acceleration
       (send _acceleration :serialize s)
     ;; duration _time_from_start
       (write-long (send _time_from_start :sec) s) (write-long (send _time_from_start :nsec) s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Transform _transform
     (send _transform :deserialize buf ptr-) (incf ptr- (send _transform :serialization-length))
   ;; geometry_msgs/Twist _velocity
     (send _velocity :deserialize buf ptr-) (incf ptr- (send _velocity :serialization-length))
   ;; geometry_msgs/Twist _acceleration
     (send _acceleration :deserialize buf ptr-) (incf ptr- (send _acceleration :serialization-length))
   ;; duration _time_from_start
     (send _time_from_start :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _time_from_start :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get human_msgs::TrajectoryPoint :md5sum-) "382e189245ac5ab9808aef582801e5c4")
(setf (get human_msgs::TrajectoryPoint :datatype-) "human_msgs/TrajectoryPoint")
(setf (get human_msgs::TrajectoryPoint :definition-)
      "geometry_msgs/Transform     transform
geometry_msgs/Twist         velocity
geometry_msgs/Twist         acceleration
duration                    time_from_start
================================================================================
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

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

")



(provide :human_msgs/TrajectoryPoint "382e189245ac5ab9808aef582801e5c4")


