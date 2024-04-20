;; Auto-generated. Do not edit!


(when (boundp 'path_assessment::Assessment)
  (if (not (find-package "PATH_ASSESSMENT"))
    (make-package "PATH_ASSESSMENT"))
  (shadow 'Assessment (find-package "PATH_ASSESSMENT")))
(unless (find-package "PATH_ASSESSMENT::ASSESSMENT")
  (make-package "PATH_ASSESSMENT::ASSESSMENT"))

(in-package "ROS")
;;//! \htmlinclude Assessment.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass path_assessment::Assessment
  :super ros::object
  :slots (_header _stop _t _robot_x _robot_y _eva_cur_h _idx_h _eva_avg_h _colli_t_h _colli_h _eva_cur_o _idx_o _eva_avg_o _colli_t_o _colli_o ))

(defmethod path_assessment::Assessment
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:stop __stop) nil)
    ((:t __t) 0.0)
    ((:robot_x __robot_x) 0.0)
    ((:robot_y __robot_y) 0.0)
    ((:eva_cur_h __eva_cur_h) 0.0)
    ((:idx_h __idx_h) 0)
    ((:eva_avg_h __eva_avg_h) 0.0)
    ((:colli_t_h __colli_t_h) 0.0)
    ((:colli_h __colli_h) 0)
    ((:eva_cur_o __eva_cur_o) 0.0)
    ((:idx_o __idx_o) 0)
    ((:eva_avg_o __eva_avg_o) 0.0)
    ((:colli_t_o __colli_t_o) 0.0)
    ((:colli_o __colli_o) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _stop __stop)
   (setq _t (float __t))
   (setq _robot_x (float __robot_x))
   (setq _robot_y (float __robot_y))
   (setq _eva_cur_h (float __eva_cur_h))
   (setq _idx_h (round __idx_h))
   (setq _eva_avg_h (float __eva_avg_h))
   (setq _colli_t_h (float __colli_t_h))
   (setq _colli_h (round __colli_h))
   (setq _eva_cur_o (float __eva_cur_o))
   (setq _idx_o (round __idx_o))
   (setq _eva_avg_o (float __eva_avg_o))
   (setq _colli_t_o (float __colli_t_o))
   (setq _colli_o (round __colli_o))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:stop
   (&optional (__stop :null))
   (if (not (eq __stop :null)) (setq _stop __stop)) _stop)
  (:t
   (&optional __t)
   (if __t (setq _t __t)) _t)
  (:robot_x
   (&optional __robot_x)
   (if __robot_x (setq _robot_x __robot_x)) _robot_x)
  (:robot_y
   (&optional __robot_y)
   (if __robot_y (setq _robot_y __robot_y)) _robot_y)
  (:eva_cur_h
   (&optional __eva_cur_h)
   (if __eva_cur_h (setq _eva_cur_h __eva_cur_h)) _eva_cur_h)
  (:idx_h
   (&optional __idx_h)
   (if __idx_h (setq _idx_h __idx_h)) _idx_h)
  (:eva_avg_h
   (&optional __eva_avg_h)
   (if __eva_avg_h (setq _eva_avg_h __eva_avg_h)) _eva_avg_h)
  (:colli_t_h
   (&optional __colli_t_h)
   (if __colli_t_h (setq _colli_t_h __colli_t_h)) _colli_t_h)
  (:colli_h
   (&optional __colli_h)
   (if __colli_h (setq _colli_h __colli_h)) _colli_h)
  (:eva_cur_o
   (&optional __eva_cur_o)
   (if __eva_cur_o (setq _eva_cur_o __eva_cur_o)) _eva_cur_o)
  (:idx_o
   (&optional __idx_o)
   (if __idx_o (setq _idx_o __idx_o)) _idx_o)
  (:eva_avg_o
   (&optional __eva_avg_o)
   (if __eva_avg_o (setq _eva_avg_o __eva_avg_o)) _eva_avg_o)
  (:colli_t_o
   (&optional __colli_t_o)
   (if __colli_t_o (setq _colli_t_o __colli_t_o)) _colli_t_o)
  (:colli_o
   (&optional __colli_o)
   (if __colli_o (setq _colli_o __colli_o)) _colli_o)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _stop
    1
    ;; float32 _t
    4
    ;; float32 _robot_x
    4
    ;; float32 _robot_y
    4
    ;; float32 _eva_cur_h
    4
    ;; int32 _idx_h
    4
    ;; float32 _eva_avg_h
    4
    ;; float32 _colli_t_h
    4
    ;; int32 _colli_h
    4
    ;; float32 _eva_cur_o
    4
    ;; int32 _idx_o
    4
    ;; float32 _eva_avg_o
    4
    ;; float32 _colli_t_o
    4
    ;; int32 _colli_o
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _stop
       (if _stop (write-byte -1 s) (write-byte 0 s))
     ;; float32 _t
       (sys::poke _t (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _robot_x
       (sys::poke _robot_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _robot_y
       (sys::poke _robot_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _eva_cur_h
       (sys::poke _eva_cur_h (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _idx_h
       (write-long _idx_h s)
     ;; float32 _eva_avg_h
       (sys::poke _eva_avg_h (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _colli_t_h
       (sys::poke _colli_t_h (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _colli_h
       (write-long _colli_h s)
     ;; float32 _eva_cur_o
       (sys::poke _eva_cur_o (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _idx_o
       (write-long _idx_o s)
     ;; float32 _eva_avg_o
       (sys::poke _eva_avg_o (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _colli_t_o
       (sys::poke _colli_t_o (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _colli_o
       (write-long _colli_o s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _stop
     (setq _stop (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _t
     (setq _t (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _robot_x
     (setq _robot_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _robot_y
     (setq _robot_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _eva_cur_h
     (setq _eva_cur_h (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _idx_h
     (setq _idx_h (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _eva_avg_h
     (setq _eva_avg_h (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _colli_t_h
     (setq _colli_t_h (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _colli_h
     (setq _colli_h (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _eva_cur_o
     (setq _eva_cur_o (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _idx_o
     (setq _idx_o (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _eva_avg_o
     (setq _eva_avg_o (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _colli_t_o
     (setq _colli_t_o (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _colli_o
     (setq _colli_o (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get path_assessment::Assessment :md5sum-) "a26b44577f75cbfac39e4760f1366a24")
(setf (get path_assessment::Assessment :datatype-) "path_assessment/Assessment")
(setf (get path_assessment::Assessment :definition-)
      "Header header
bool stop
float32 t
float32 robot_x
float32 robot_y
float32 eva_cur_h
int32 idx_h
float32 eva_avg_h
float32 colli_t_h
int32 colli_h
float32 eva_cur_o
int32 idx_o
float32 eva_avg_o
float32 colli_t_o
int32 colli_o

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



(provide :path_assessment/Assessment "a26b44577f75cbfac39e4760f1366a24")


