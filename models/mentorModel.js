const mongoose = require("mongoose");
const moment = require("moment-timezone");
const { category } = require("../utils/constants");

const MentorSchema = new mongoose.Schema({
  username: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    required: true,
  },
  fromGoogle: {
    type:Boolean,
    default:false
  },
  password: {
    type: String,
    required: function(){
      if(this.fromGoogle){
          return false;
      }
      return true;
  }
  },
  qualification: {
    type: String,
  },
  about: {
    type: String,
  },
  chargesph: {
    type: Number,
    required: true,
  },
  profession: {
    type: String,
    enum: category,
    required: true,
  },
  disorders: [
    {
      "disorder_name":{
        type: String
      }
    },
  ],
  imagepath: {
    type: String,
    default: "https://t4.ftcdn.net/jpg/05/89/93/27/360_F_589932782_vQAEAZhHnq1QCGu5ikwrYaQD0Mmurm0N.jpg",
  },
  createdAt: {
    type: Date,
    default: () => moment().tz("Asia/Kolkata").format(),
  },
  totalReviews: {
    type: Number,
    default: 0,
  },
  totalStars: {
    type: Number,
    default: 0,
  },
//   active_status: {
//     type: Boolean,
//     default: false,
//   },
  token: {
    type:String,
    default:""
  },
  isVerified: {
    type: Boolean,
    default: false 
  }
});

const MentorModal = mongoose.model("Mentor", MentorSchema);
module.exports = MentorModal;
