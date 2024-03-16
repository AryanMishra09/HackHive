const mongoose = require("mongoose");
const moment = require("moment-timezone");

const UserSchema = new mongoose.Schema({
  username: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    required: [true, "email is necessary"],
  },
  mobileno:{
    type:Number,
  },
  activestatus: {
    type: Boolean,
    default: false,
  },
  createdAt: {
    type: Date,
    default: () => moment().tz("Asia/Kolkata").format(),
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
  walletBalance: {
    type: Number,
    default: 0,
  },
//   sessions: [{ type: mongoose.Types.ObjectId, ref: SessionModel }],
  imagepath: {
    type: String,
    default: "https://t4.ftcdn.net/jpg/05/89/93/27/360_F_589932782_vQAEAZhHnq1QCGu5ikwrYaQD0Mmurm0N.jpg",
  },
  token: {
    type:String,
    default:""
  },
  isVerified: {
    type: Boolean,
    default: false 
  }
  
},{timestamps:true});

UserSchema.methods.updator = async function () {
  const currentDate = Date.now();
  console.log(this);
  await this.populate("sessions");
  this.sessions.filter((session) => {
    return session.date >= currentDate;
  });
  return await this.save();
};

const UserModel = mongoose.model("User", UserSchema);
module.exports = UserModel;
