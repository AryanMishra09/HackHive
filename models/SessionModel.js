const mongoose = require("mongoose");
const { markSessions, slotTimings } = require("../utils/constants.js");
const moment = require("moment-timezone");

const sessionSchema = new mongoose.Schema({
  mentorId: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref: "Mentor",
  },
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref: "User",
  },
//   walletTransactionId: {
//     type: mongoose.Schema.Types.ObjectId,
//     required: true,
//     ref: "WalletTransaction",
//   },
  date: {
    type: Date,
    required: true,
  },
  meetLink: {
    type: String,
    default: "Yet to be scheduled by the psychologist",
  },
  sessionStatus:{ 
      type: String, 
      enum: markSessions, 
      default: "Pending",
  },
  slot:{ 
      type: String, 
      enum: slotTimings, 
  },
  createdAt: {
    type: String,
    default: () => moment().tz("Asia/Kolkata").format(),
  }
});

const SessionModel = mongoose.model("Session", sessionSchema);
module.exports = SessionModel;
