; Auto-generated. Do not edit!


(cl:in-package walker_msgs-srv)


;//! \htmlinclude PushingActionTrigger-request.msg.html

(cl:defclass <PushingActionTrigger-request> (roslisp-msg-protocol:ros-message)
  ((duration_in_seconds
    :reader duration_in_seconds
    :initarg :duration_in_seconds
    :type cl:float
    :initform 0.0))
)

(cl:defclass PushingActionTrigger-request (<PushingActionTrigger-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PushingActionTrigger-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PushingActionTrigger-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name walker_msgs-srv:<PushingActionTrigger-request> is deprecated: use walker_msgs-srv:PushingActionTrigger-request instead.")))

(cl:ensure-generic-function 'duration_in_seconds-val :lambda-list '(m))
(cl:defmethod duration_in_seconds-val ((m <PushingActionTrigger-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-srv:duration_in_seconds-val is deprecated.  Use walker_msgs-srv:duration_in_seconds instead.")
  (duration_in_seconds m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PushingActionTrigger-request>) ostream)
  "Serializes a message object of type '<PushingActionTrigger-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'duration_in_seconds))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PushingActionTrigger-request>) istream)
  "Deserializes a message object of type '<PushingActionTrigger-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'duration_in_seconds) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PushingActionTrigger-request>)))
  "Returns string type for a service object of type '<PushingActionTrigger-request>"
  "walker_msgs/PushingActionTriggerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PushingActionTrigger-request)))
  "Returns string type for a service object of type 'PushingActionTrigger-request"
  "walker_msgs/PushingActionTriggerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PushingActionTrigger-request>)))
  "Returns md5sum for a message object of type '<PushingActionTrigger-request>"
  "91c2eaf71113b433d55580921476f329")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PushingActionTrigger-request)))
  "Returns md5sum for a message object of type 'PushingActionTrigger-request"
  "91c2eaf71113b433d55580921476f329")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PushingActionTrigger-request>)))
  "Returns full string definition for message of type '<PushingActionTrigger-request>"
  (cl:format cl:nil "float32 duration_in_seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PushingActionTrigger-request)))
  "Returns full string definition for message of type 'PushingActionTrigger-request"
  (cl:format cl:nil "float32 duration_in_seconds~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PushingActionTrigger-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PushingActionTrigger-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PushingActionTrigger-request
    (cl:cons ':duration_in_seconds (duration_in_seconds msg))
))
;//! \htmlinclude PushingActionTrigger-response.msg.html

(cl:defclass <PushingActionTrigger-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PushingActionTrigger-response (<PushingActionTrigger-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PushingActionTrigger-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PushingActionTrigger-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name walker_msgs-srv:<PushingActionTrigger-response> is deprecated: use walker_msgs-srv:PushingActionTrigger-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <PushingActionTrigger-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-srv:success-val is deprecated.  Use walker_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PushingActionTrigger-response>) ostream)
  "Serializes a message object of type '<PushingActionTrigger-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PushingActionTrigger-response>) istream)
  "Deserializes a message object of type '<PushingActionTrigger-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PushingActionTrigger-response>)))
  "Returns string type for a service object of type '<PushingActionTrigger-response>"
  "walker_msgs/PushingActionTriggerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PushingActionTrigger-response)))
  "Returns string type for a service object of type 'PushingActionTrigger-response"
  "walker_msgs/PushingActionTriggerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PushingActionTrigger-response>)))
  "Returns md5sum for a message object of type '<PushingActionTrigger-response>"
  "91c2eaf71113b433d55580921476f329")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PushingActionTrigger-response)))
  "Returns md5sum for a message object of type 'PushingActionTrigger-response"
  "91c2eaf71113b433d55580921476f329")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PushingActionTrigger-response>)))
  "Returns full string definition for message of type '<PushingActionTrigger-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PushingActionTrigger-response)))
  "Returns full string definition for message of type 'PushingActionTrigger-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PushingActionTrigger-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PushingActionTrigger-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PushingActionTrigger-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PushingActionTrigger)))
  'PushingActionTrigger-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PushingActionTrigger)))
  'PushingActionTrigger-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PushingActionTrigger)))
  "Returns string type for a service object of type '<PushingActionTrigger>"
  "walker_msgs/PushingActionTrigger")