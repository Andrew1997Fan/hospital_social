; Auto-generated. Do not edit!


(cl:in-package path_assessment-msg)


;//! \htmlinclude Assessment.msg.html

(cl:defclass <Assessment> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (stop
    :reader stop
    :initarg :stop
    :type cl:boolean
    :initform cl:nil)
   (t
    :reader t
    :initarg :t
    :type cl:float
    :initform 0.0)
   (robot_x
    :reader robot_x
    :initarg :robot_x
    :type cl:float
    :initform 0.0)
   (robot_y
    :reader robot_y
    :initarg :robot_y
    :type cl:float
    :initform 0.0)
   (eva_cur_h
    :reader eva_cur_h
    :initarg :eva_cur_h
    :type cl:float
    :initform 0.0)
   (idx_h
    :reader idx_h
    :initarg :idx_h
    :type cl:integer
    :initform 0)
   (eva_avg_h
    :reader eva_avg_h
    :initarg :eva_avg_h
    :type cl:float
    :initform 0.0)
   (colli_t_h
    :reader colli_t_h
    :initarg :colli_t_h
    :type cl:float
    :initform 0.0)
   (colli_h
    :reader colli_h
    :initarg :colli_h
    :type cl:integer
    :initform 0)
   (eva_cur_o
    :reader eva_cur_o
    :initarg :eva_cur_o
    :type cl:float
    :initform 0.0)
   (idx_o
    :reader idx_o
    :initarg :idx_o
    :type cl:integer
    :initform 0)
   (eva_avg_o
    :reader eva_avg_o
    :initarg :eva_avg_o
    :type cl:float
    :initform 0.0)
   (colli_t_o
    :reader colli_t_o
    :initarg :colli_t_o
    :type cl:float
    :initform 0.0)
   (colli_o
    :reader colli_o
    :initarg :colli_o
    :type cl:integer
    :initform 0))
)

(cl:defclass Assessment (<Assessment>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Assessment>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Assessment)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_assessment-msg:<Assessment> is deprecated: use path_assessment-msg:Assessment instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Assessment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_assessment-msg:header-val is deprecated.  Use path_assessment-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'stop-val :lambda-list '(m))
(cl:defmethod stop-val ((m <Assessment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_assessment-msg:stop-val is deprecated.  Use path_assessment-msg:stop instead.")
  (stop m))

(cl:ensure-generic-function 't-val :lambda-list '(m))
(cl:defmethod t-val ((m <Assessment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_assessment-msg:t-val is deprecated.  Use path_assessment-msg:t instead.")
  (t m))

(cl:ensure-generic-function 'robot_x-val :lambda-list '(m))
(cl:defmethod robot_x-val ((m <Assessment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_assessment-msg:robot_x-val is deprecated.  Use path_assessment-msg:robot_x instead.")
  (robot_x m))

(cl:ensure-generic-function 'robot_y-val :lambda-list '(m))
(cl:defmethod robot_y-val ((m <Assessment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_assessment-msg:robot_y-val is deprecated.  Use path_assessment-msg:robot_y instead.")
  (robot_y m))

(cl:ensure-generic-function 'eva_cur_h-val :lambda-list '(m))
(cl:defmethod eva_cur_h-val ((m <Assessment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_assessment-msg:eva_cur_h-val is deprecated.  Use path_assessment-msg:eva_cur_h instead.")
  (eva_cur_h m))

(cl:ensure-generic-function 'idx_h-val :lambda-list '(m))
(cl:defmethod idx_h-val ((m <Assessment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_assessment-msg:idx_h-val is deprecated.  Use path_assessment-msg:idx_h instead.")
  (idx_h m))

(cl:ensure-generic-function 'eva_avg_h-val :lambda-list '(m))
(cl:defmethod eva_avg_h-val ((m <Assessment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_assessment-msg:eva_avg_h-val is deprecated.  Use path_assessment-msg:eva_avg_h instead.")
  (eva_avg_h m))

(cl:ensure-generic-function 'colli_t_h-val :lambda-list '(m))
(cl:defmethod colli_t_h-val ((m <Assessment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_assessment-msg:colli_t_h-val is deprecated.  Use path_assessment-msg:colli_t_h instead.")
  (colli_t_h m))

(cl:ensure-generic-function 'colli_h-val :lambda-list '(m))
(cl:defmethod colli_h-val ((m <Assessment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_assessment-msg:colli_h-val is deprecated.  Use path_assessment-msg:colli_h instead.")
  (colli_h m))

(cl:ensure-generic-function 'eva_cur_o-val :lambda-list '(m))
(cl:defmethod eva_cur_o-val ((m <Assessment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_assessment-msg:eva_cur_o-val is deprecated.  Use path_assessment-msg:eva_cur_o instead.")
  (eva_cur_o m))

(cl:ensure-generic-function 'idx_o-val :lambda-list '(m))
(cl:defmethod idx_o-val ((m <Assessment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_assessment-msg:idx_o-val is deprecated.  Use path_assessment-msg:idx_o instead.")
  (idx_o m))

(cl:ensure-generic-function 'eva_avg_o-val :lambda-list '(m))
(cl:defmethod eva_avg_o-val ((m <Assessment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_assessment-msg:eva_avg_o-val is deprecated.  Use path_assessment-msg:eva_avg_o instead.")
  (eva_avg_o m))

(cl:ensure-generic-function 'colli_t_o-val :lambda-list '(m))
(cl:defmethod colli_t_o-val ((m <Assessment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_assessment-msg:colli_t_o-val is deprecated.  Use path_assessment-msg:colli_t_o instead.")
  (colli_t_o m))

(cl:ensure-generic-function 'colli_o-val :lambda-list '(m))
(cl:defmethod colli_o-val ((m <Assessment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_assessment-msg:colli_o-val is deprecated.  Use path_assessment-msg:colli_o instead.")
  (colli_o m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Assessment>) ostream)
  "Serializes a message object of type '<Assessment>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'stop) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 't))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'robot_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'robot_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'eva_cur_h))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'idx_h)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'eva_avg_h))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'colli_t_h))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'colli_h)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'eva_cur_o))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'idx_o)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'eva_avg_o))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'colli_t_o))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'colli_o)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Assessment>) istream)
  "Deserializes a message object of type '<Assessment>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'stop) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 't) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'robot_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'robot_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'eva_cur_h) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'idx_h) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'eva_avg_h) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'colli_t_h) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'colli_h) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'eva_cur_o) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'idx_o) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'eva_avg_o) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'colli_t_o) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'colli_o) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Assessment>)))
  "Returns string type for a message object of type '<Assessment>"
  "path_assessment/Assessment")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Assessment)))
  "Returns string type for a message object of type 'Assessment"
  "path_assessment/Assessment")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Assessment>)))
  "Returns md5sum for a message object of type '<Assessment>"
  "a26b44577f75cbfac39e4760f1366a24")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Assessment)))
  "Returns md5sum for a message object of type 'Assessment"
  "a26b44577f75cbfac39e4760f1366a24")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Assessment>)))
  "Returns full string definition for message of type '<Assessment>"
  (cl:format cl:nil "Header header~%bool stop~%float32 t~%float32 robot_x~%float32 robot_y~%float32 eva_cur_h~%int32 idx_h~%float32 eva_avg_h~%float32 colli_t_h~%int32 colli_h~%float32 eva_cur_o~%int32 idx_o~%float32 eva_avg_o~%float32 colli_t_o~%int32 colli_o~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Assessment)))
  "Returns full string definition for message of type 'Assessment"
  (cl:format cl:nil "Header header~%bool stop~%float32 t~%float32 robot_x~%float32 robot_y~%float32 eva_cur_h~%int32 idx_h~%float32 eva_avg_h~%float32 colli_t_h~%int32 colli_h~%float32 eva_cur_o~%int32 idx_o~%float32 eva_avg_o~%float32 colli_t_o~%int32 colli_o~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Assessment>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Assessment>))
  "Converts a ROS message object to a list"
  (cl:list 'Assessment
    (cl:cons ':header (header msg))
    (cl:cons ':stop (stop msg))
    (cl:cons ':t (t msg))
    (cl:cons ':robot_x (robot_x msg))
    (cl:cons ':robot_y (robot_y msg))
    (cl:cons ':eva_cur_h (eva_cur_h msg))
    (cl:cons ':idx_h (idx_h msg))
    (cl:cons ':eva_avg_h (eva_avg_h msg))
    (cl:cons ':colli_t_h (colli_t_h msg))
    (cl:cons ':colli_h (colli_h msg))
    (cl:cons ':eva_cur_o (eva_cur_o msg))
    (cl:cons ':idx_o (idx_o msg))
    (cl:cons ':eva_avg_o (eva_avg_o msg))
    (cl:cons ':colli_t_o (colli_t_o msg))
    (cl:cons ':colli_o (colli_o msg))
))
