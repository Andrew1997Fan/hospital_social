; Auto-generated. Do not edit!


(cl:in-package detection_msgs-srv)


;//! \htmlinclude Detection2DTrig-request.msg.html

(cl:defclass <Detection2DTrig-request> (roslisp-msg-protocol:ros-message)
  ((image
    :reader image
    :initarg :image
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass Detection2DTrig-request (<Detection2DTrig-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Detection2DTrig-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Detection2DTrig-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name detection_msgs-srv:<Detection2DTrig-request> is deprecated: use detection_msgs-srv:Detection2DTrig-request instead.")))

(cl:ensure-generic-function 'image-val :lambda-list '(m))
(cl:defmethod image-val ((m <Detection2DTrig-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader detection_msgs-srv:image-val is deprecated.  Use detection_msgs-srv:image instead.")
  (image m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Detection2DTrig-request>) ostream)
  "Serializes a message object of type '<Detection2DTrig-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'image) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Detection2DTrig-request>) istream)
  "Deserializes a message object of type '<Detection2DTrig-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'image) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Detection2DTrig-request>)))
  "Returns string type for a service object of type '<Detection2DTrig-request>"
  "detection_msgs/Detection2DTrigRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Detection2DTrig-request)))
  "Returns string type for a service object of type 'Detection2DTrig-request"
  "detection_msgs/Detection2DTrigRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Detection2DTrig-request>)))
  "Returns md5sum for a message object of type '<Detection2DTrig-request>"
  "0251bb8adb2f48f90dce794921ecbc66")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Detection2DTrig-request)))
  "Returns md5sum for a message object of type 'Detection2DTrig-request"
  "0251bb8adb2f48f90dce794921ecbc66")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Detection2DTrig-request>)))
  "Returns full string definition for message of type '<Detection2DTrig-request>"
  (cl:format cl:nil "sensor_msgs/Image image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Detection2DTrig-request)))
  "Returns full string definition for message of type 'Detection2DTrig-request"
  (cl:format cl:nil "sensor_msgs/Image image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Detection2DTrig-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'image))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Detection2DTrig-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Detection2DTrig-request
    (cl:cons ':image (image msg))
))
;//! \htmlinclude Detection2DTrig-response.msg.html

(cl:defclass <Detection2DTrig-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type detection_msgs-msg:Detection2D
    :initform (cl:make-instance 'detection_msgs-msg:Detection2D)))
)

(cl:defclass Detection2DTrig-response (<Detection2DTrig-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Detection2DTrig-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Detection2DTrig-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name detection_msgs-srv:<Detection2DTrig-response> is deprecated: use detection_msgs-srv:Detection2DTrig-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <Detection2DTrig-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader detection_msgs-srv:result-val is deprecated.  Use detection_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Detection2DTrig-response>) ostream)
  "Serializes a message object of type '<Detection2DTrig-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'result) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Detection2DTrig-response>) istream)
  "Deserializes a message object of type '<Detection2DTrig-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'result) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Detection2DTrig-response>)))
  "Returns string type for a service object of type '<Detection2DTrig-response>"
  "detection_msgs/Detection2DTrigResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Detection2DTrig-response)))
  "Returns string type for a service object of type 'Detection2DTrig-response"
  "detection_msgs/Detection2DTrigResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Detection2DTrig-response>)))
  "Returns md5sum for a message object of type '<Detection2DTrig-response>"
  "0251bb8adb2f48f90dce794921ecbc66")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Detection2DTrig-response)))
  "Returns md5sum for a message object of type 'Detection2DTrig-response"
  "0251bb8adb2f48f90dce794921ecbc66")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Detection2DTrig-response>)))
  "Returns full string definition for message of type '<Detection2DTrig-response>"
  (cl:format cl:nil "detection_msgs/Detection2D result~%~%================================================================================~%MSG: detection_msgs/Detection2D~%std_msgs/Header header~%~%detection_msgs/BBox2D[] boxes~%~%sensor_msgs/Image result_image~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: detection_msgs/BBox2D~%string class_name~%float32 score~%int32 id~%~%geometry_msgs/Pose2D center~%float32 size_x~%float32 size_y~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Detection2DTrig-response)))
  "Returns full string definition for message of type 'Detection2DTrig-response"
  (cl:format cl:nil "detection_msgs/Detection2D result~%~%================================================================================~%MSG: detection_msgs/Detection2D~%std_msgs/Header header~%~%detection_msgs/BBox2D[] boxes~%~%sensor_msgs/Image result_image~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: detection_msgs/BBox2D~%string class_name~%float32 score~%int32 id~%~%geometry_msgs/Pose2D center~%float32 size_x~%float32 size_y~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Detection2DTrig-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Detection2DTrig-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Detection2DTrig-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Detection2DTrig)))
  'Detection2DTrig-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Detection2DTrig)))
  'Detection2DTrig-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Detection2DTrig)))
  "Returns string type for a service object of type '<Detection2DTrig>"
  "detection_msgs/Detection2DTrig")