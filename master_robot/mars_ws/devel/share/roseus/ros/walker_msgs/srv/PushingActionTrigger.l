;; Auto-generated. Do not edit!


(when (boundp 'walker_msgs::PushingActionTrigger)
  (if (not (find-package "WALKER_MSGS"))
    (make-package "WALKER_MSGS"))
  (shadow 'PushingActionTrigger (find-package "WALKER_MSGS")))
(unless (find-package "WALKER_MSGS::PUSHINGACTIONTRIGGER")
  (make-package "WALKER_MSGS::PUSHINGACTIONTRIGGER"))
(unless (find-package "WALKER_MSGS::PUSHINGACTIONTRIGGERREQUEST")
  (make-package "WALKER_MSGS::PUSHINGACTIONTRIGGERREQUEST"))
(unless (find-package "WALKER_MSGS::PUSHINGACTIONTRIGGERRESPONSE")
  (make-package "WALKER_MSGS::PUSHINGACTIONTRIGGERRESPONSE"))

(in-package "ROS")





(defclass walker_msgs::PushingActionTriggerRequest
  :super ros::object
  :slots (_duration_in_seconds ))

(defmethod walker_msgs::PushingActionTriggerRequest
  (:init
   (&key
    ((:duration_in_seconds __duration_in_seconds) 0.0)
    )
   (send-super :init)
   (setq _duration_in_seconds (float __duration_in_seconds))
   self)
  (:duration_in_seconds
   (&optional __duration_in_seconds)
   (if __duration_in_seconds (setq _duration_in_seconds __duration_in_seconds)) _duration_in_seconds)
  (:serialization-length
   ()
   (+
    ;; float32 _duration_in_seconds
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _duration_in_seconds
       (sys::poke _duration_in_seconds (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _duration_in_seconds
     (setq _duration_in_seconds (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass walker_msgs::PushingActionTriggerResponse
  :super ros::object
  :slots (_success ))

(defmethod walker_msgs::PushingActionTriggerResponse
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

(defclass walker_msgs::PushingActionTrigger
  :super ros::object
  :slots ())

(setf (get walker_msgs::PushingActionTrigger :md5sum-) "91c2eaf71113b433d55580921476f329")
(setf (get walker_msgs::PushingActionTrigger :datatype-) "walker_msgs/PushingActionTrigger")
(setf (get walker_msgs::PushingActionTrigger :request) walker_msgs::PushingActionTriggerRequest)
(setf (get walker_msgs::PushingActionTrigger :response) walker_msgs::PushingActionTriggerResponse)

(defmethod walker_msgs::PushingActionTriggerRequest
  (:response () (instance walker_msgs::PushingActionTriggerResponse :init)))

(setf (get walker_msgs::PushingActionTriggerRequest :md5sum-) "91c2eaf71113b433d55580921476f329")
(setf (get walker_msgs::PushingActionTriggerRequest :datatype-) "walker_msgs/PushingActionTriggerRequest")
(setf (get walker_msgs::PushingActionTriggerRequest :definition-)
      "float32 duration_in_seconds
---
bool success
")

(setf (get walker_msgs::PushingActionTriggerResponse :md5sum-) "91c2eaf71113b433d55580921476f329")
(setf (get walker_msgs::PushingActionTriggerResponse :datatype-) "walker_msgs/PushingActionTriggerResponse")
(setf (get walker_msgs::PushingActionTriggerResponse :definition-)
      "float32 duration_in_seconds
---
bool success
")



(provide :walker_msgs/PushingActionTrigger "91c2eaf71113b433d55580921476f329")


