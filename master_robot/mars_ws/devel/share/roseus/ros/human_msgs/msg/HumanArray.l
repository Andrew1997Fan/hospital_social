;; Auto-generated. Do not edit!


(when (boundp 'human_msgs::HumanArray)
  (if (not (find-package "HUMAN_MSGS"))
    (make-package "HUMAN_MSGS"))
  (shadow 'HumanArray (find-package "HUMAN_MSGS")))
(unless (find-package "HUMAN_MSGS::HUMANARRAY")
  (make-package "HUMAN_MSGS::HUMANARRAY"))

(in-package "ROS")
;;//! \htmlinclude HumanArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass human_msgs::HumanArray
  :super ros::object
  :slots (_header _ids _humans ))

(defmethod human_msgs::HumanArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:ids __ids) (make-array 0 :initial-element 0 :element-type :integer))
    ((:humans __humans) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _ids __ids)
   (setq _humans __humans)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:ids
   (&optional __ids)
   (if __ids (setq _ids __ids)) _ids)
  (:humans
   (&rest __humans)
   (if (keywordp (car __humans))
       (send* _humans __humans)
     (progn
       (if __humans (setq _humans (car __humans)))
       _humans)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint64[] _ids
    (* 8    (length _ids)) 4
    ;; human_msgs/HumanMarker[] _humans
    (apply #'+ (send-all _humans :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint64[] _ids
     (write-long (length _ids) s)
     (dotimes (i (length _ids))
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _ids i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _ids i)) (= (length ((elt _ids i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _ids i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _ids i) . bv) 1) -1) s))
             ((and (class (elt _ids i)) (= (length ((elt _ids i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _ids i) . bv) 0) s)
              (write-long (if (>= (elt _ids i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _ids i) s)(write-long (if (>= (elt _ids i) 0) 0 #xffffffff) s)))
       )
     ;; human_msgs/HumanMarker[] _humans
     (write-long (length _humans) s)
     (dolist (elem _humans)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint64[] _ids
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ids (instantiate integer-vector n))
     (dotimes (i n)
     
#+(or :alpha :irix6 :x86_64)
      (setf (elt _ids i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _ids i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     ))
   ;; human_msgs/HumanMarker[] _humans
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _humans (let (r) (dotimes (i n) (push (instance human_msgs::HumanMarker :init) r)) r))
     (dolist (elem- _humans)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get human_msgs::HumanArray :md5sum-) "95bfc2275b7504c7d840e1ffb2f38e7d")
(setf (get human_msgs::HumanArray :datatype-) "human_msgs/HumanArray")
(setf (get human_msgs::HumanArray :definition-)
      "Header        header
uint64[]       ids
HumanMarker[] humans

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



(provide :human_msgs/HumanArray "95bfc2275b7504c7d840e1ffb2f38e7d")


