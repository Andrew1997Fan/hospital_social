;; Auto-generated. Do not edit!


(when (boundp 'walker_msgs::Det3DArray)
  (if (not (find-package "WALKER_MSGS"))
    (make-package "WALKER_MSGS"))
  (shadow 'Det3DArray (find-package "WALKER_MSGS")))
(unless (find-package "WALKER_MSGS::DET3DARRAY")
  (make-package "WALKER_MSGS::DET3DARRAY"))

(in-package "ROS")
;;//! \htmlinclude Det3DArray.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass walker_msgs::Det3DArray
  :super ros::object
  :slots (_header _dets_list _scan ))

(defmethod walker_msgs::Det3DArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:dets_list __dets_list) ())
    ((:scan __scan) (instance sensor_msgs::LaserScan :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _dets_list __dets_list)
   (setq _scan __scan)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:dets_list
   (&rest __dets_list)
   (if (keywordp (car __dets_list))
       (send* _dets_list __dets_list)
     (progn
       (if __dets_list (setq _dets_list (car __dets_list)))
       _dets_list)))
  (:scan
   (&rest __scan)
   (if (keywordp (car __scan))
       (send* _scan __scan)
     (progn
       (if __scan (setq _scan (car __scan)))
       _scan)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; walker_msgs/Det3D[] _dets_list
    (apply #'+ (send-all _dets_list :serialization-length)) 4
    ;; sensor_msgs/LaserScan _scan
    (send _scan :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; walker_msgs/Det3D[] _dets_list
     (write-long (length _dets_list) s)
     (dolist (elem _dets_list)
       (send elem :serialize s)
       )
     ;; sensor_msgs/LaserScan _scan
       (send _scan :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; walker_msgs/Det3D[] _dets_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _dets_list (let (r) (dotimes (i n) (push (instance walker_msgs::Det3D :init) r)) r))
     (dolist (elem- _dets_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; sensor_msgs/LaserScan _scan
     (send _scan :deserialize buf ptr-) (incf ptr- (send _scan :serialization-length))
   ;;
   self)
  )

(setf (get walker_msgs::Det3DArray :md5sum-) "ac412ba09615d1ef263df0188d01a3b6")
(setf (get walker_msgs::Det3DArray :datatype-) "walker_msgs/Det3DArray")
(setf (get walker_msgs::Det3DArray :definition-)
      "std_msgs/Header header

walker_msgs/Det3D[] dets_list

sensor_msgs/LaserScan scan

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
MSG: walker_msgs/Det3D
float32 x
float32 y
float32 z
float32 yaw
float32 radius
float32 confidence
string class_name
int8 class_id

float32 h
float32 w
float32 l

================================================================================
MSG: sensor_msgs/LaserScan
# Single scan from a planar laser range-finder
#
# If you have another ranging device with different behavior (e.g. a sonar
# array), please find or create a different message, since applications
# will make fairly laser-specific assumptions about this data

Header header            # timestamp in the header is the acquisition time of 
                         # the first ray in the scan.
                         #
                         # in frame frame_id, angles are measured around 
                         # the positive Z axis (counterclockwise, if Z is up)
                         # with zero angle being forward along the x axis
                         
float32 angle_min        # start angle of the scan [rad]
float32 angle_max        # end angle of the scan [rad]
float32 angle_increment  # angular distance between measurements [rad]

float32 time_increment   # time between measurements [seconds] - if your scanner
                         # is moving, this will be used in interpolating position
                         # of 3d points
float32 scan_time        # time between scans [seconds]

float32 range_min        # minimum range value [m]
float32 range_max        # maximum range value [m]

float32[] ranges         # range data [m] (Note: values < range_min or > range_max should be discarded)
float32[] intensities    # intensity data [device-specific units].  If your
                         # device does not provide intensities, please leave
                         # the array empty.

")



(provide :walker_msgs/Det3DArray "ac412ba09615d1ef263df0188d01a3b6")


