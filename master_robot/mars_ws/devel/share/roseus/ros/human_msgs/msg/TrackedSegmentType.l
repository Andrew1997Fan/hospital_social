;; Auto-generated. Do not edit!


(when (boundp 'human_msgs::TrackedSegmentType)
  (if (not (find-package "HUMAN_MSGS"))
    (make-package "HUMAN_MSGS"))
  (shadow 'TrackedSegmentType (find-package "HUMAN_MSGS")))
(unless (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE")
  (make-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))

(in-package "ROS")
;;//! \htmlinclude TrackedSegmentType.msg.html


(intern "*HEAD*" (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(shadow '*HEAD* (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(defconstant human_msgs::TrackedSegmentType::*HEAD* 0)
(intern "*TORSO*" (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(shadow '*TORSO* (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(defconstant human_msgs::TrackedSegmentType::*TORSO* 1)
(intern "*RIGHT_SHOULDER*" (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(shadow '*RIGHT_SHOULDER* (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(defconstant human_msgs::TrackedSegmentType::*RIGHT_SHOULDER* 2)
(intern "*RIGHT_ELBOW*" (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(shadow '*RIGHT_ELBOW* (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(defconstant human_msgs::TrackedSegmentType::*RIGHT_ELBOW* 3)
(intern "*RIGHT_WRIST*" (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(shadow '*RIGHT_WRIST* (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(defconstant human_msgs::TrackedSegmentType::*RIGHT_WRIST* 4)
(intern "*RIGHT_HIP*" (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(shadow '*RIGHT_HIP* (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(defconstant human_msgs::TrackedSegmentType::*RIGHT_HIP* 5)
(intern "*RIGHT_KNEE*" (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(shadow '*RIGHT_KNEE* (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(defconstant human_msgs::TrackedSegmentType::*RIGHT_KNEE* 6)
(intern "*RIGHT_ANKLE*" (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(shadow '*RIGHT_ANKLE* (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(defconstant human_msgs::TrackedSegmentType::*RIGHT_ANKLE* 7)
(intern "*LEFT_SHOULDER*" (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(shadow '*LEFT_SHOULDER* (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(defconstant human_msgs::TrackedSegmentType::*LEFT_SHOULDER* 8)
(intern "*LEFT_ELBOW*" (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(shadow '*LEFT_ELBOW* (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(defconstant human_msgs::TrackedSegmentType::*LEFT_ELBOW* 9)
(intern "*LEFT_WRIST*" (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(shadow '*LEFT_WRIST* (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(defconstant human_msgs::TrackedSegmentType::*LEFT_WRIST* 10)
(intern "*LEFT_HIP*" (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(shadow '*LEFT_HIP* (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(defconstant human_msgs::TrackedSegmentType::*LEFT_HIP* 11)
(intern "*LEFT_KNEE*" (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(shadow '*LEFT_KNEE* (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(defconstant human_msgs::TrackedSegmentType::*LEFT_KNEE* 12)
(intern "*LEFT_ANKLE*" (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(shadow '*LEFT_ANKLE* (find-package "HUMAN_MSGS::TRACKEDSEGMENTTYPE"))
(defconstant human_msgs::TrackedSegmentType::*LEFT_ANKLE* 13)

(defun human_msgs::TrackedSegmentType-to-symbol (const)
  (cond
        ((= const 0) 'human_msgs::TrackedSegmentType::*HEAD*)
        ((= const 1) 'human_msgs::TrackedSegmentType::*TORSO*)
        ((= const 2) 'human_msgs::TrackedSegmentType::*RIGHT_SHOULDER*)
        ((= const 3) 'human_msgs::TrackedSegmentType::*RIGHT_ELBOW*)
        ((= const 4) 'human_msgs::TrackedSegmentType::*RIGHT_WRIST*)
        ((= const 5) 'human_msgs::TrackedSegmentType::*RIGHT_HIP*)
        ((= const 6) 'human_msgs::TrackedSegmentType::*RIGHT_KNEE*)
        ((= const 7) 'human_msgs::TrackedSegmentType::*RIGHT_ANKLE*)
        ((= const 8) 'human_msgs::TrackedSegmentType::*LEFT_SHOULDER*)
        ((= const 9) 'human_msgs::TrackedSegmentType::*LEFT_ELBOW*)
        ((= const 10) 'human_msgs::TrackedSegmentType::*LEFT_WRIST*)
        ((= const 11) 'human_msgs::TrackedSegmentType::*LEFT_HIP*)
        ((= const 12) 'human_msgs::TrackedSegmentType::*LEFT_KNEE*)
        ((= const 13) 'human_msgs::TrackedSegmentType::*LEFT_ANKLE*)
        (t nil)))

(defclass human_msgs::TrackedSegmentType
  :super ros::object
  :slots ())

(defmethod human_msgs::TrackedSegmentType
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(setf (get human_msgs::TrackedSegmentType :md5sum-) "68d3b979cac8949295c8f9c93334f520")
(setf (get human_msgs::TrackedSegmentType :datatype-) "human_msgs/TrackedSegmentType")
(setf (get human_msgs::TrackedSegmentType :definition-)
      "# constants, adapted from human avatar in morse simulator
int8    HEAD=0
int8    TORSO=1
int8    RIGHT_SHOULDER=2
int8    RIGHT_ELBOW=3
int8    RIGHT_WRIST=4
int8    RIGHT_HIP=5
int8    RIGHT_KNEE=6
int8    RIGHT_ANKLE=7
int8    LEFT_SHOULDER=8
int8    LEFT_ELBOW=9
int8    LEFT_WRIST=10
int8    LEFT_HIP=11
int8    LEFT_KNEE=12
int8    LEFT_ANKLE=13

")



(provide :human_msgs/TrackedSegmentType "68d3b979cac8949295c8f9c93334f520")


