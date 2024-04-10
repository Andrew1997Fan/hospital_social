;; Auto-generated. Do not edit!


(when (boundp 'human_msgs::HumanTimeToGoal)
  (if (not (find-package "HUMAN_MSGS"))
    (make-package "HUMAN_MSGS"))
  (shadow 'HumanTimeToGoal (find-package "HUMAN_MSGS")))
(unless (find-package "HUMAN_MSGS::HUMANTIMETOGOAL")
  (make-package "HUMAN_MSGS::HUMANTIMETOGOAL"))

(in-package "ROS")
;;//! \htmlinclude HumanTimeToGoal.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass human_msgs::HumanTimeToGoal
  :super ros::object
  :slots (_header _id _time_to_goal ))

(defmethod human_msgs::HumanTimeToGoal
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:id __id) 0)
    ((:time_to_goal __time_to_goal) (instance ros::time :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _id (round __id))
   (setq _time_to_goal __time_to_goal)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:time_to_goal
   (&optional __time_to_goal)
   (if __time_to_goal (setq _time_to_goal __time_to_goal)) _time_to_goal)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint64 _id
    8
    ;; duration _time_to_goal
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint64 _id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _id) (= (length (_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_id . bv) 0) 0) s)
              (write-long (ash (elt (_id . bv) 1) -1) s))
             ((and (class _id) (= (length (_id . bv)) 1)) ;; big1
              (write-long (elt (_id . bv) 0) s)
              (write-long (if (>= _id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _id s)(write-long (if (>= _id 0) 0 #xffffffff) s)))
     ;; duration _time_to_goal
       (write-long (send _time_to_goal :sec) s) (write-long (send _time_to_goal :nsec) s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint64 _id
     
#+(or :alpha :irix6 :x86_64)
      (setf _id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; duration _time_to_goal
     (send _time_to_goal :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _time_to_goal :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get human_msgs::HumanTimeToGoal :md5sum-) "53febe69f749a65c5e82fa24e0ebeaec")
(setf (get human_msgs::HumanTimeToGoal :datatype-) "human_msgs/HumanTimeToGoal")
(setf (get human_msgs::HumanTimeToGoal :definition-)
      "std_msgs/Header header
uint64          id
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



(provide :human_msgs/HumanTimeToGoal "53febe69f749a65c5e82fa24e0ebeaec")


