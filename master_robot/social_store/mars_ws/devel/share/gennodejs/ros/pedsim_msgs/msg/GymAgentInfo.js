// Auto-generated. Do not edit!

// (in-package pedsim_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class GymAgentInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.init_pose2d = null;
      this.waypoints_list = null;
    }
    else {
      if (initObj.hasOwnProperty('init_pose2d')) {
        this.init_pose2d = initObj.init_pose2d
      }
      else {
        this.init_pose2d = new geometry_msgs.msg.Pose2D();
      }
      if (initObj.hasOwnProperty('waypoints_list')) {
        this.waypoints_list = initObj.waypoints_list
      }
      else {
        this.waypoints_list = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GymAgentInfo
    // Serialize message field [init_pose2d]
    bufferOffset = geometry_msgs.msg.Pose2D.serialize(obj.init_pose2d, buffer, bufferOffset);
    // Serialize message field [waypoints_list]
    // Serialize the length for message field [waypoints_list]
    bufferOffset = _serializer.uint32(obj.waypoints_list.length, buffer, bufferOffset);
    obj.waypoints_list.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Pose2D.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GymAgentInfo
    let len;
    let data = new GymAgentInfo(null);
    // Deserialize message field [init_pose2d]
    data.init_pose2d = geometry_msgs.msg.Pose2D.deserialize(buffer, bufferOffset);
    // Deserialize message field [waypoints_list]
    // Deserialize array length for message field [waypoints_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.waypoints_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.waypoints_list[i] = geometry_msgs.msg.Pose2D.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 24 * object.waypoints_list.length;
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pedsim_msgs/GymAgentInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7c16d0b53f72a3ed400f25f621b18ae2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new GymAgentInfo(null);
    if (msg.init_pose2d !== undefined) {
      resolved.init_pose2d = geometry_msgs.msg.Pose2D.Resolve(msg.init_pose2d)
    }
    else {
      resolved.init_pose2d = new geometry_msgs.msg.Pose2D()
    }

    if (msg.waypoints_list !== undefined) {
      resolved.waypoints_list = new Array(msg.waypoints_list.length);
      for (let i = 0; i < resolved.waypoints_list.length; ++i) {
        resolved.waypoints_list[i] = geometry_msgs.msg.Pose2D.Resolve(msg.waypoints_list[i]);
      }
    }
    else {
      resolved.waypoints_list = []
    }

    return resolved;
    }
};

module.exports = GymAgentInfo;
