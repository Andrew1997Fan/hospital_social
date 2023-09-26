// Auto-generated. Do not edit!

// (in-package walker_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class PushingActionTriggerRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.duration_in_seconds = null;
    }
    else {
      if (initObj.hasOwnProperty('duration_in_seconds')) {
        this.duration_in_seconds = initObj.duration_in_seconds
      }
      else {
        this.duration_in_seconds = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PushingActionTriggerRequest
    // Serialize message field [duration_in_seconds]
    bufferOffset = _serializer.float32(obj.duration_in_seconds, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PushingActionTriggerRequest
    let len;
    let data = new PushingActionTriggerRequest(null);
    // Deserialize message field [duration_in_seconds]
    data.duration_in_seconds = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'walker_msgs/PushingActionTriggerRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5a5baff76f6275e472a6acb9653f2fd0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 duration_in_seconds
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PushingActionTriggerRequest(null);
    if (msg.duration_in_seconds !== undefined) {
      resolved.duration_in_seconds = msg.duration_in_seconds;
    }
    else {
      resolved.duration_in_seconds = 0.0
    }

    return resolved;
    }
};

class PushingActionTriggerResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PushingActionTriggerResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PushingActionTriggerResponse
    let len;
    let data = new PushingActionTriggerResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'walker_msgs/PushingActionTriggerResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PushingActionTriggerResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: PushingActionTriggerRequest,
  Response: PushingActionTriggerResponse,
  md5sum() { return '91c2eaf71113b433d55580921476f329'; },
  datatype() { return 'walker_msgs/PushingActionTrigger'; }
};
