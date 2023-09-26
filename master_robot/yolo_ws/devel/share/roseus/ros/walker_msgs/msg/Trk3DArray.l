;; Auto-generated. Do not edit!


(when (boundp 'walker_msgs::Trk3DArray)
  (if (not (find-package "WALKER_MSGS"))
    (make-package "WALKER_MSGS"))
  (shadow 'Trk3DArray (find-package "WALKER_MSGS")))
(unless (find-package "WALKER_MSGS::TRK3DARRAY")
  (make-package "WALKER_MSGS::TRK3DARRAY"))

(in-package "ROS")
;;//! \htmlinclude Trk3DArray.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass walker_msgs::Trk3DArray
  :super ros::object
  :slots (_header _trks_list _scan ))

(defmethod walker_msgs::Trk3DArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:trks_list __trks_list) ())
    ((:scan __scan) (instance sensor_msgs::LaserScan :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _trks_list __trks_list)
   (setq _scan __scan)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:trks_list
   (&rest __trks_list)
   (if (keywordp (car __trks_list))
       (send* _trks_list __trks_list)
     (progn
       (if __trks_list (setq _trks_list (car __trks_list)))
       _trks_list)))
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
    ;; walker_msgs/Trk3D[] _trks_list
    (apply #'+ (send-all _trks_list :serialization-length)) 4
    ;; sensor_msgs/LaserScan _scan
    (send _scan :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; walker_msgs/Trk3D[] _trks_list
     (write-long (length _trks_list) s)
     (dolist (elem _trks_list)
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
   ;; walker_msgs/Trk3D[] _trks_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _trks_list (let (r) (dotimes (i n) (push (instance walker_msgs::Trk3D :init) r)) r))
     (dolist (elem- _trks_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; sensor_msgs/LaserScan _scan
     (send _scan :deserialize buf ptr-) (incf ptr- (send _scan :serialization-length))
   ;;
   self)
  )

(setf (get walker_msgs::Trk3DArray :md5sum-) "fa9fb358e0c209d46c15396441e8da78")
(setf (get walker_msgs::Trk3DArray :datatype-) "walker_msgs/Trk3DArray")
(setf (get walker_msgs::Trk3DArray :definition-)
      "std_msgs/Header header

walker_msgs/Trk3D[] trks_list

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
MSG: walker_msgs/Trk3D
float32 x
float32 y
float32 vx
float32 vy
float32 yaw
float32 radius
float32 confidence
int8 class_id
float32 dangerous
float32 x_based
float32 y_based
float32 z_based
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



(provide :walker_msgs/Trk3DArray "fa9fb358e0c209d46c15396441e8da78")


