
"use strict";

let DetectedPersons = require('./DetectedPersons.js');
let TrackedPersons = require('./TrackedPersons.js');
let TrackedGroup = require('./TrackedGroup.js');
let TrackedPersons2d = require('./TrackedPersons2d.js');
let ImmDebugInfos = require('./ImmDebugInfos.js');
let TrackedPerson2d = require('./TrackedPerson2d.js');
let TrackedGroups = require('./TrackedGroups.js');
let DetectedPerson = require('./DetectedPerson.js');
let PersonTrajectoryEntry = require('./PersonTrajectoryEntry.js');
let TrackedPerson = require('./TrackedPerson.js');
let CompositeDetectedPerson = require('./CompositeDetectedPerson.js');
let PersonTrajectory = require('./PersonTrajectory.js');
let TrackingTimingMetrics = require('./TrackingTimingMetrics.js');
let CompositeDetectedPersons = require('./CompositeDetectedPersons.js');
let ImmDebugInfo = require('./ImmDebugInfo.js');

module.exports = {
  DetectedPersons: DetectedPersons,
  TrackedPersons: TrackedPersons,
  TrackedGroup: TrackedGroup,
  TrackedPersons2d: TrackedPersons2d,
  ImmDebugInfos: ImmDebugInfos,
  TrackedPerson2d: TrackedPerson2d,
  TrackedGroups: TrackedGroups,
  DetectedPerson: DetectedPerson,
  PersonTrajectoryEntry: PersonTrajectoryEntry,
  TrackedPerson: TrackedPerson,
  CompositeDetectedPerson: CompositeDetectedPerson,
  PersonTrajectory: PersonTrajectory,
  TrackingTimingMetrics: TrackingTimingMetrics,
  CompositeDetectedPersons: CompositeDetectedPersons,
  ImmDebugInfo: ImmDebugInfo,
};
