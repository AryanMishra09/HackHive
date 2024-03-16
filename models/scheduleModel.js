const mongoose = require("mongoose");
const { slotTimings } = require("../utils/constants.js");
const moment = require("moment-timezone");

const ScheduleSchema = new mongoose.Schema({
  mentorId: {
    type: mongoose.Types.ObjectId,
    ref: "Mentor",
  },
  userId: {
    type: mongoose.Types.ObjectId,
    ref: "User",
  },
  date: {
    type: Date,
    required: true,
  },
  slots:[
    { 
    type: String, 
    enum: slotTimings, 
    }
  ],
  createdAt: {
    type: String,
    default: () => moment().tz("Asia/Kolkata").format(),
  }
});

const ScheduleModel = mongoose.model("Schedule", ScheduleSchema);
module.exports = ScheduleModel;
