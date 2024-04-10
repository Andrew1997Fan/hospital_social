// Auto-generated. Do not edit!

// (in-package human_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class TrackedSegmentType {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrackedSegmentType
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrackedSegmentType
    let len;
    let data = new TrackedSegmentType(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a message object
    return 'human_msgs/TrackedSegmentType';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '68d3b979cac8949295c8f9c93334f520';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # constants, adapted from human avatar in morse simulator
    int8    HEAD=0
    int8    TORSO=1
    int8    RIGHT_SHOULDER=2
    int8    RIGHT_ELBOW=3
    int8    RIGHT_WRIST=4
    int8    RIGHT_HIP=5
    int8    RIGHT_KNEE=6
    int8    RIGHT_ANKLE=7
    int8    LEFT_SHOULDER=8
    int8    LEFT_ELBOW=9
    int8    LEFT_WRIST=10
    int8    LEFT_HIP=11
    int8    LEFT_KNEE=12
    int8    LEFT_ANKLE=13
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TrackedSegmentType(null);
    return resolved;
    }
};

// Constants for message
TrackedSegmentType.Constants = {
  HEAD: 0,
  TORSO: 1,
  RIGHT_SHOULDER: 2,
  RIGHT_ELBOW: 3,
  RIGHT_WRIST: 4,
  RIGHT_HIP: 5,
  RIGHT_KNEE: 6,
  RIGHT_ANKLE: 7,
  LEFT_SHOULDER: 8,
  LEFT_ELBOW: 9,
  LEFT_WRIST: 10,
  LEFT_HIP: 11,
  LEFT_KNEE: 12,
  LEFT_ANKLE: 13,
}

module.exports = TrackedSegmentType;
