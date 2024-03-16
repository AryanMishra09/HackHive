const mongoose = require("mongoose");
const moment = require("moment-timezone");
const BookingSchema = new mongoose.Schema({
  userId: {
    type: mongoose.Schema.ObjectId,
    required: true,
    ref: "User",
  },
  mentorId: {
    type: mongoose.Schema.ObjectId,
    required: true,
    ref: "Mentor",
  },
  slot:{
    type: String,
    required:true,
  },
  duration: {
    type: Number,
    default: 45,
  },
  amount: {
    type: Number,
    default: 379
  },
  date: {
    type: Date,
    required: true,
  },
  createdAt: {
    type: String,
    default: () => moment().tz("Asia/Kolkata").format(),
  }
});
const BookingModel = mongoose.model("Booking", BookingSchema);
module.exports = BookingModel;
