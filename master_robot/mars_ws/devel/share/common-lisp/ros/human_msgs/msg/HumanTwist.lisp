; Auto-generated. Do not edit!


(cl:in-package human_msgs-msg)


;//! \htmlinclude HumanTwist.msg.html

(cl:defclass <HumanTwist> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (twist
    :reader twist
    :initarg :twist
    :type geometry_msgs-msg:Twist
    :initform (cl:make-instance 'geometry_msgs-msg:Twist)))
)

(cl:defclass HumanTwist (<HumanTwist>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HumanTwist>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HumanTwist)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name human_msgs-msg:<HumanTwist> is deprecated: use human_msgs-msg:HumanTwist instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <HumanTwist>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_msgs-msg:id-val is deprecated.  Use human_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'twist-val :lambda-list '(m))
(cl:defmethod twist-val ((m <HumanTwist>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader human_msgs-msg:twist-val is deprecated.  Use human_msgs-msg:twist instead.")
  (twist m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HumanTwist>) ostream)
  "Serializes a message object of type '<HumanTwist>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'id)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'twist) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HumanTwist>) istream)
  "Deserializes a message object of type '<HumanTwist>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'id)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'twist) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HumanTwist>)))
  "Returns string type for a message object of type '<HumanTwist>"
  "human_msgs/HumanTwist")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HumanTwist)))
  "Returns string type for a message object of type 'HumanTwist"
  "human_msgs/HumanTwist")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HumanTwist>)))
  "Returns md5sum for a message object of type '<HumanTwist>"
  "2a13f6dfa6e5d280c2d013ce807ed0b9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HumanTwist)))
  "Returns md5sum for a message object of type 'HumanTwist"
  "2a13f6dfa6e5d280c2d013ce807ed0b9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HumanTwist>)))
  "Returns full string definition for message of type '<HumanTwist>"
  (cl:format cl:nil "uint64              id~%geometry_msgs/Twist twist~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HumanTwist)))
  "Returns full string definition for message of type 'HumanTwist"
  (cl:format cl:nil "uint64              id~%geometry_msgs/Twist twist~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HumanTwist>))
  (cl:+ 0
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'twist))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HumanTwist>))
  "Converts a ROS message object to a list"
  (cl:list 'HumanTwist
    (cl:cons ':id (id msg))
    (cl:cons ':twist (twist msg))
))
