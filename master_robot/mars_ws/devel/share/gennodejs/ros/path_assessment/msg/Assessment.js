// Auto-generated. Do not edit!

// (in-package path_assessment.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Assessment {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.stop = null;
      this.t = null;
      this.robot_x = null;
      this.robot_y = null;
      this.eva_cur_h = null;
      this.idx_h = null;
      this.eva_avg_h = null;
      this.colli_t_h = null;
      this.colli_h = null;
      this.eva_cur_o = null;
      this.idx_o = null;
      this.eva_avg_o = null;
      this.colli_t_o = null;
      this.colli_o = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('stop')) {
        this.stop = initObj.stop
      }
      else {
        this.stop = false;
      }
      if (initObj.hasOwnProperty('t')) {
        this.t = initObj.t
      }
      else {
        this.t = 0.0;
      }
      if (initObj.hasOwnProperty('robot_x')) {
        this.robot_x = initObj.robot_x
      }
      else {
        this.robot_x = 0.0;
      }
      if (initObj.hasOwnProperty('robot_y')) {
        this.robot_y = initObj.robot_y
      }
      else {
        this.robot_y = 0.0;
      }
      if (initObj.hasOwnProperty('eva_cur_h')) {
        this.eva_cur_h = initObj.eva_cur_h
      }
      else {
        this.eva_cur_h = 0.0;
      }
      if (initObj.hasOwnProperty('idx_h')) {
        this.idx_h = initObj.idx_h
      }
      else {
        this.idx_h = 0;
      }
      if (initObj.hasOwnProperty('eva_avg_h')) {
        this.eva_avg_h = initObj.eva_avg_h
      }
      else {
        this.eva_avg_h = 0.0;
      }
      if (initObj.hasOwnProperty('colli_t_h')) {
        this.colli_t_h = initObj.colli_t_h
      }
      else {
        this.colli_t_h = 0.0;
      }
      if (initObj.hasOwnProperty('colli_h')) {
        this.colli_h = initObj.colli_h
      }
      else {
        this.colli_h = 0;
      }
      if (initObj.hasOwnProperty('eva_cur_o')) {
        this.eva_cur_o = initObj.eva_cur_o
      }
      else {
        this.eva_cur_o = 0.0;
      }
      if (initObj.hasOwnProperty('idx_o')) {
        this.idx_o = initObj.idx_o
      }
      else {
        this.idx_o = 0;
      }
      if (initObj.hasOwnProperty('eva_avg_o')) {
        this.eva_avg_o = initObj.eva_avg_o
      }
      else {
        this.eva_avg_o = 0.0;
      }
      if (initObj.hasOwnProperty('colli_t_o')) {
        this.colli_t_o = initObj.colli_t_o
      }
      else {
        this.colli_t_o = 0.0;
      }
      if (initObj.hasOwnProperty('colli_o')) {
        this.colli_o = initObj.colli_o
      }
      else {
        this.colli_o = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Assessment
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [stop]
    bufferOffset = _serializer.bool(obj.stop, buffer, bufferOffset);
    // Serialize message field [t]
    bufferOffset = _serializer.float32(obj.t, buffer, bufferOffset);
    // Serialize message field [robot_x]
    bufferOffset = _serializer.float32(obj.robot_x, buffer, bufferOffset);
    // Serialize message field [robot_y]
    bufferOffset = _serializer.float32(obj.robot_y, buffer, bufferOffset);
    // Serialize message field [eva_cur_h]
    bufferOffset = _serializer.float32(obj.eva_cur_h, buffer, bufferOffset);
    // Serialize message field [idx_h]
    bufferOffset = _serializer.int32(obj.idx_h, buffer, bufferOffset);
    // Serialize message field [eva_avg_h]
    bufferOffset = _serializer.float32(obj.eva_avg_h, buffer, bufferOffset);
    // Serialize message field [colli_t_h]
    bufferOffset = _serializer.float32(obj.colli_t_h, buffer, bufferOffset);
    // Serialize message field [colli_h]
    bufferOffset = _serializer.int32(obj.colli_h, buffer, bufferOffset);
    // Serialize message field [eva_cur_o]
    bufferOffset = _serializer.float32(obj.eva_cur_o, buffer, bufferOffset);
    // Serialize message field [idx_o]
    bufferOffset = _serializer.int32(obj.idx_o, buffer, bufferOffset);
    // Serialize message field [eva_avg_o]
    bufferOffset = _serializer.float32(obj.eva_avg_o, buffer, bufferOffset);
    // Serialize message field [colli_t_o]
    bufferOffset = _serializer.float32(obj.colli_t_o, buffer, bufferOffset);
    // Serialize message field [colli_o]
    bufferOffset = _serializer.int32(obj.colli_o, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Assessment
    let len;
    let data = new Assessment(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [stop]
    data.stop = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [t]
    data.t = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [robot_x]
    data.robot_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [robot_y]
    data.robot_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [eva_cur_h]
    data.eva_cur_h = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [idx_h]
    data.idx_h = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [eva_avg_h]
    data.eva_avg_h = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [colli_t_h]
    data.colli_t_h = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [colli_h]
    data.colli_h = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [eva_cur_o]
    data.eva_cur_o = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [idx_o]
    data.idx_o = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [eva_avg_o]
    data.eva_avg_o = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [colli_t_o]
    data.colli_t_o = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [colli_o]
    data.colli_o = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 53;
  }

  static datatype() {
    // Returns string type for a message object
    return 'path_assessment/Assessment';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a26b44577f75cbfac39e4760f1366a24';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Assessment(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.stop !== undefined) {
      resolved.stop = msg.stop;
    }
    else {
      resolved.stop = false
    }

    if (msg.t !== undefined) {
      resolved.t = msg.t;
    }
    else {
      resolved.t = 0.0
    }

    if (msg.robot_x !== undefined) {
      resolved.robot_x = msg.robot_x;
    }
    else {
      resolved.robot_x = 0.0
    }

    if (msg.robot_y !== undefined) {
      resolved.robot_y = msg.robot_y;
    }
    else {
      resolved.robot_y = 0.0
    }

    if (msg.eva_cur_h !== undefined) {
      resolved.eva_cur_h = msg.eva_cur_h;
    }
    else {
      resolved.eva_cur_h = 0.0
    }

    if (msg.idx_h !== undefined) {
      resolved.idx_h = msg.idx_h;
    }
    else {
      resolved.idx_h = 0
    }

    if (msg.eva_avg_h !== undefined) {
      resolved.eva_avg_h = msg.eva_avg_h;
    }
    else {
      resolved.eva_avg_h = 0.0
    }

    if (msg.colli_t_h !== undefined) {
      resolved.colli_t_h = msg.colli_t_h;
    }
    else {
      resolved.colli_t_h = 0.0
    }

    if (msg.colli_h !== undefined) {
      resolved.colli_h = msg.colli_h;
    }
    else {
      resolved.colli_h = 0
    }

    if (msg.eva_cur_o !== undefined) {
      resolved.eva_cur_o = msg.eva_cur_o;
    }
    else {
      resolved.eva_cur_o = 0.0
    }

    if (msg.idx_o !== undefined) {
      resolved.idx_o = msg.idx_o;
    }
    else {
      resolved.idx_o = 0
    }

    if (msg.eva_avg_o !== undefined) {
      resolved.eva_avg_o = msg.eva_avg_o;
    }
    else {
      resolved.eva_avg_o = 0.0
    }

    if (msg.colli_t_o !== undefined) {
      resolved.colli_t_o = msg.colli_t_o;
    }
    else {
      resolved.colli_t_o = 0.0
    }

    if (msg.colli_o !== undefined) {
      resolved.colli_o = msg.colli_o;
    }
    else {
      resolved.colli_o = 0
    }

    return resolved;
    }
};

module.exports = Assessment;
