// Auto-generated. Do not edit!

// (in-package human_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let HumanMarker = require('./HumanMarker.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class HumanArray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.ids = null;
      this.humans = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('ids')) {
        this.ids = initObj.ids
      }
      else {
        this.ids = [];
      }
      if (initObj.hasOwnProperty('humans')) {
        this.humans = initObj.humans
      }
      else {
        this.humans = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type HumanArray
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [ids]
    bufferOffset = _arraySerializer.uint64(obj.ids, buffer, bufferOffset, null);
    // Serialize message field [humans]
    // Serialize the length for message field [humans]
    bufferOffset = _serializer.uint32(obj.humans.length, buffer, bufferOffset);
    obj.humans.forEach((val) => {
      bufferOffset = HumanMarker.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type HumanArray
    let len;
    let data = new HumanArray(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [ids]
    data.ids = _arrayDeserializer.uint64(buffer, bufferOffset, null)
    // Deserialize message field [humans]
    // Deserialize array length for message field [humans]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.humans = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.humans[i] = HumanMarker.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 8 * object.ids.length;
    length += 113 * object.humans.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'human_msgs/HumanArray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '95bfc2275b7504c7d840e1ffb2f38e7d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header        header
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new HumanArray(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.ids !== undefined) {
      resolved.ids = msg.ids;
    }
    else {
      resolved.ids = []
    }

    if (msg.humans !== undefined) {
      resolved.humans = new Array(msg.humans.length);
      for (let i = 0; i < resolved.humans.length; ++i) {
        resolved.humans[i] = HumanMarker.Resolve(msg.humans[i]);
      }
    }
    else {
      resolved.humans = []
    }

    return resolved;
    }
};

module.exports = HumanArray;
