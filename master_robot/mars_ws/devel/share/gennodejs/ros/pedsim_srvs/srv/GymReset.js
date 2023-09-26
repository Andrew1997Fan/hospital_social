// Auto-generated. Do not edit!

// (in-package pedsim_srvs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let pedsim_msgs = _finder('pedsim_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class GymResetRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.agents_list = null;
    }
    else {
      if (initObj.hasOwnProperty('agents_list')) {
        this.agents_list = initObj.agents_list
      }
      else {
        this.agents_list = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GymResetRequest
    // Serialize message field [agents_list]
    // Serialize the length for message field [agents_list]
    bufferOffset = _serializer.uint32(obj.agents_list.length, buffer, bufferOffset);
    obj.agents_list.forEach((val) => {
      bufferOffset = pedsim_msgs.msg.GymAgentInfo.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GymResetRequest
    let len;
    let data = new GymResetRequest(null);
    // Deserialize message field [agents_list]
    // Deserialize array length for message field [agents_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.agents_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.agents_list[i] = pedsim_msgs.msg.GymAgentInfo.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.agents_list.forEach((val) => {
      length += pedsim_msgs.msg.GymAgentInfo.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pedsim_srvs/GymResetRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9abbb83c72232af33703953db3d87b22';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    pedsim_msgs/GymAgentInfo[] agents_list
    
    ================================================================================
    MSG: pedsim_msgs/GymAgentInfo
    geometry_msgs/Pose2D    init_pose2d
    geometry_msgs/Pose2D[]  waypoints_list
    ================================================================================
    MSG: geometry_msgs/Pose2D
    # Deprecated
    # Please use the full 3D pose.
    
    # In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.
    
    # If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.
    
    
    # This expresses a position and orientation on a 2D manifold.
    
    float64 x
    float64 y
    float64 theta
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GymResetRequest(null);
    if (msg.agents_list !== undefined) {
      resolved.agents_list = new Array(msg.agents_list.length);
      for (let i = 0; i < resolved.agents_list.length; ++i) {
        resolved.agents_list[i] = pedsim_msgs.msg.GymAgentInfo.Resolve(msg.agents_list[i]);
      }
    }
    else {
      resolved.agents_list = []
    }

    return resolved;
    }
};

class GymResetResponse {
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
    // Serializes a message object of type GymResetResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GymResetResponse
    let len;
    let data = new GymResetResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pedsim_srvs/GymResetResponse';
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
    const resolved = new GymResetResponse(null);
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
  Request: GymResetRequest,
  Response: GymResetResponse,
  md5sum() { return 'a97915fd01741ae65f8ce47a0e7cc85c'; },
  datatype() { return 'pedsim_srvs/GymReset'; }
};
