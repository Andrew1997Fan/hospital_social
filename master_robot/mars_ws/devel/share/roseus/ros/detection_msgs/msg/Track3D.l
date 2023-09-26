;; Auto-generated. Do not edit!


(when (boundp 'detection_msgs::Track3D)
  (if (not (find-package "DETECTION_MSGS"))
    (make-package "DETECTION_MSGS"))
  (shadow 'Track3D (find-package "DETECTION_MSGS")))
(unless (find-package "DETECTION_MSGS::TRACK3D")
  (make-package "DETECTION_MSGS::TRACK3D"))

(in-package "ROS")
;;//! \htmlinclude Track3D.msg.html


(defclass detection_msgs::Track3D
  :super ros::object
  :slots (_x _y _vel_x _vel_y _yaw _radius _confidence _class_id _dangerous ))

(defmethod detection_msgs::Track3D
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:vel_x __vel_x) 0.0)
    ((:vel_y __vel_y) 0.0)
    ((:yaw __yaw) 0.0)
    ((:radius __radius) 0.0)
    ((:confidence __confidence) 0.0)
    ((:class_id __class_id) 0)
    ((:dangerous __dangerous) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _vel_x (float __vel_x))
   (setq _vel_y (float __vel_y))
   (setq _yaw (float __yaw))
   (setq _radius (float __radius))
   (setq _confidence (float __confidence))
   (setq _class_id (round __class_id))
   (setq _dangerous (float __dangerous))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:vel_x
   (&optional __vel_x)
   (if __vel_x (setq _vel_x __vel_x)) _vel_x)
  (:vel_y
   (&optional __vel_y)
   (if __vel_y (setq _vel_y __vel_y)) _vel_y)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:radius
   (&optional __radius)
   (if __radius (setq _radius __radius)) _radius)
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
  (:class_id
   (&optional __class_id)
   (if __class_id (setq _class_id __class_id)) _class_id)
  (:dangerous
   (&optional __dangerous)
   (if __dangerous (setq _dangerous __dangerous)) _dangerous)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _vel_x
    4
    ;; float32 _vel_y
    4
    ;; float32 _yaw
    4
    ;; float32 _radius
    4
    ;; float32 _confidence
    4
    ;; int8 _class_id
    1
    ;; float32 _dangerous
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vel_x
       (sys::poke _vel_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vel_y
       (sys::poke _vel_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _radius
       (sys::poke _radius (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _confidence
       (sys::poke _confidence (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int8 _class_id
       (write-byte _class_id s)
     ;; float32 _dangerous
       (sys::poke _dangerous (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vel_x
     (setq _vel_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vel_y
     (setq _vel_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _radius
     (setq _radius (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _confidence
     (setq _confidence (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int8 _class_id
     (setq _class_id (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _class_id 127) (setq _class_id (- _class_id 256)))
   ;; float32 _dangerous
     (setq _dangerous (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get detection_msgs::Track3D :md5sum-) "320ec20fd8002a93782dccfcbf591df4")
(setf (get detection_msgs::Track3D :datatype-) "detection_msgs/Track3D")
(setf (get detection_msgs::Track3D :definition-)
      "float32 x
float32 y
float32 vel_x
float32 vel_y
float32 yaw
float32 radius
float32 confidence
int8 class_id
float32 dangerous
")



(provide :detection_msgs/Track3D "320ec20fd8002a93782dccfcbf591df4")


