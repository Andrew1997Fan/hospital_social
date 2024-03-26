; Auto-generated. Do not edit!


(cl:in-package human_msgs-msg)


;//! \htmlinclude TrackedSegmentType.msg.html

(cl:defclass <TrackedSegmentType> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass TrackedSegmentType (<TrackedSegmentType>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrackedSegmentType>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrackedSegmentType)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name human_msgs-msg:<TrackedSegmentType> is deprecated: use human_msgs-msg:TrackedSegmentType instead.")))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<TrackedSegmentType>)))
    "Constants for message type '<TrackedSegmentType>"
  '((:HEAD . 0)
    (:TORSO . 1)
    (:RIGHT_SHOULDER . 2)
    (:RIGHT_ELBOW . 3)
    (:RIGHT_WRIST . 4)
    (:RIGHT_HIP . 5)
    (:RIGHT_KNEE . 6)
    (:RIGHT_ANKLE . 7)
    (:LEFT_SHOULDER . 8)
    (:LEFT_ELBOW . 9)
    (:LEFT_WRIST . 10)
    (:LEFT_HIP . 11)
    (:LEFT_KNEE . 12)
    (:LEFT_ANKLE . 13))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'TrackedSegmentType)))
    "Constants for message type 'TrackedSegmentType"
  '((:HEAD . 0)
    (:TORSO . 1)
    (:RIGHT_SHOULDER . 2)
    (:RIGHT_ELBOW . 3)
    (:RIGHT_WRIST . 4)
    (:RIGHT_HIP . 5)
    (:RIGHT_KNEE . 6)
    (:RIGHT_ANKLE . 7)
    (:LEFT_SHOULDER . 8)
    (:LEFT_ELBOW . 9)
    (:LEFT_WRIST . 10)
    (:LEFT_HIP . 11)
    (:LEFT_KNEE . 12)
    (:LEFT_ANKLE . 13))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrackedSegmentType>) ostream)
  "Serializes a message object of type '<TrackedSegmentType>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrackedSegmentType>) istream)
  "Deserializes a message object of type '<TrackedSegmentType>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrackedSegmentType>)))
  "Returns string type for a message object of type '<TrackedSegmentType>"
  "human_msgs/TrackedSegmentType")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrackedSegmentType)))
  "Returns string type for a message object of type 'TrackedSegmentType"
  "human_msgs/TrackedSegmentType")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrackedSegmentType>)))
  "Returns md5sum for a message object of type '<TrackedSegmentType>"
  "68d3b979cac8949295c8f9c93334f520")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrackedSegmentType)))
  "Returns md5sum for a message object of type 'TrackedSegmentType"
  "68d3b979cac8949295c8f9c93334f520")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrackedSegmentType>)))
  "Returns full string definition for message of type '<TrackedSegmentType>"
  (cl:format cl:nil "# constants, adapted from human avatar in morse simulator~%int8    HEAD=0~%int8    TORSO=1~%int8    RIGHT_SHOULDER=2~%int8    RIGHT_ELBOW=3~%int8    RIGHT_WRIST=4~%int8    RIGHT_HIP=5~%int8    RIGHT_KNEE=6~%int8    RIGHT_ANKLE=7~%int8    LEFT_SHOULDER=8~%int8    LEFT_ELBOW=9~%int8    LEFT_WRIST=10~%int8    LEFT_HIP=11~%int8    LEFT_KNEE=12~%int8    LEFT_ANKLE=13~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrackedSegmentType)))
  "Returns full string definition for message of type 'TrackedSegmentType"
  (cl:format cl:nil "# constants, adapted from human avatar in morse simulator~%int8    HEAD=0~%int8    TORSO=1~%int8    RIGHT_SHOULDER=2~%int8    RIGHT_ELBOW=3~%int8    RIGHT_WRIST=4~%int8    RIGHT_HIP=5~%int8    RIGHT_KNEE=6~%int8    RIGHT_ANKLE=7~%int8    LEFT_SHOULDER=8~%int8    LEFT_ELBOW=9~%int8    LEFT_WRIST=10~%int8    LEFT_HIP=11~%int8    LEFT_KNEE=12~%int8    LEFT_ANKLE=13~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrackedSegmentType>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrackedSegmentType>))
  "Converts a ROS message object to a list"
  (cl:list 'TrackedSegmentType
))
