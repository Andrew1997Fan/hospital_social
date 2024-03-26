;; Auto-generated. Do not edit!


(when (boundp 'human_msgs::StateArray)
  (if (not (find-package "HUMAN_MSGS"))
    (make-package "HUMAN_MSGS"))
  (shadow 'StateArray (find-package "HUMAN_MSGS")))
(unless (find-package "HUMAN_MSGS::STATEARRAY")
  (make-package "HUMAN_MSGS::STATEARRAY"))

(in-package "ROS")
;;//! \htmlinclude StateArray.msg.html


(defclass human_msgs::StateArray
  :super ros::object
  :slots (_states ))

(defmethod human_msgs::StateArray
  (:init
   (&key
    ((:states __states) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _states __states)
   self)
  (:states
   (&optional __states)
   (if __states (setq _states __states)) _states)
  (:serialization-length
   ()
   (+
    ;; int8[] _states
    (* 1    (length _states)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8[] _states
     (write-long (length _states) s)
     (dotimes (i (length _states))
       (write-byte (elt _states i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8[] _states
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _states (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _states i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _states i) 127) (setf (elt _states i) (- (elt _states i) 256)))
     ))
   ;;
   self)
  )

(setf (get human_msgs::StateArray :md5sum-) "a75f16128abc8fcd8c322b9708a2c247")
(setf (get human_msgs::StateArray :datatype-) "human_msgs/StateArray")
(setf (get human_msgs::StateArray :definition-)
      "int8[] states

")



(provide :human_msgs/StateArray "a75f16128abc8fcd8c322b9708a2c247")


