const MentorModal = require("../models/mentorModel");
const ScheduleModel = require("../models/scheduleModel");
const { SendVerifyEmail } = require("../services/mailingServices");
const { slotTimings } = require("../utils/constants");
const { hashPassword, comparePassword } = require("../utils/passwordUtils");
const { createJWT } = require("../utils/tokenUtils");

//User Register
const register = async (req, res, next) => {

    const {username, email, password, imagepath, profession, qualification, about, chargesph, disorders } = req.body;
    try {
      const existingUser = await MentorModal.findOne({ email });
      if(existingUser){
        return  res.status(403).json({
            success: false,
            message: "Email already registered!"
        });
      }
      const hashedPassword = await hashPassword(password);

      if(username === ""){
        return res.status(StatusCodes.NotFoundError).json({message: 'Please enter Name'});
      } else if (email === ""){ 
        return res.status(StatusCodes.NotFoundError).json({message: 'Please enter email'})
      } else if (password === ""){
        return res.status(StatusCodes.NotFoundError).json({message: 'Please enter password'})
      }
      const token = Math.floor(100000 + Math.random() * 900000);
      const newUser = new MentorModal({
        username,
        email,
        password: hashedPassword,
        imagepath,
        token,
        qualification,
        about,
        chargesph,
        disorders,
        profession,
      });
      await newUser.save();
      SendVerifyEmail(newUser.username, newUser.email, token);
      const {password: pass, ...rest} = newUser._doc;
      res.status(200).json({
        message:"Registration Successfull! An OTP has been sent to your email. Verify by entering the OTP",
        rest
      });
    } catch (error) {
        console.log(error.message);
        return res.status(500).json({
            success: false,
            message: "Something went wrong!"
        });
    }
};

//verify user email:
const verifyEmail = async(req, res, next)=>{
    try {
      const {token, email} = req.body;
      const user = await MentorModal.findOne({ email: email });
      if(!user){
        return res.status(403).json({
            success: false,
            message: "This email Id is not registered in our app."
        });
      }
    const validUser = await MentorModal.findOne({token});
    if(!validUser){
        const deletedUser = await MentorModal.deleteOne({ email });
        return res.status(404).json({
            success: false,
            message: 'Invalid OTP Entered. You have to register again!',
        })
    }else{
      const user = await MentorModal.findByIdAndUpdate(
        {
          _id: validUser._id
        },
        {
          $set: {
            token:"",
            isVerified: true,
          }
        },
        {new:true}
      );
      return res.status(200).json({
        success: true,
        message: "Your Account has been verified Successfully! Please Login",
      });
    }
    } catch (error) {
        console.log(error.message);
        return res.status(500).json({
            success: false,
            message: "Something went wrong!"
        });
    }
}

//login user 
const login = async (req, res, next) => {
    const user = await MentorModal.findOne({ email: req.body.email });
    if(!user){
      return res.status(403).json({
        success: false,
        message: "Email is not registered. Please Register first!",
      })
    }
    if(user && !user.isVerified){
        return res.status(403).json({
            success: false,
            message: "Email is not verified. Please Verify your email first!",
        })
    }
    const isValidUser =
      user && (await comparePassword(req.body.password, user.password));
    if (!isValidUser)
    return res.status(403).json({
        success: false,
        message: "Invalid Credentials Entered!!!",
    })
  
    const token = createJWT({
      userId: user._id,
      role: "Mentor",
      imageURL: user.imagepath,
    });
    const oneDay = 1000 * 60 * 60 * 24;
    res.cookie("token", token, {
      httpOnly: true,
      expires: new Date(Date.now() + oneDay),
      secure: process.env.NODE_ENV === "production",
    });
    const {password: pass, ...rest} = user._doc;
    
    return res.status(200).json({
        success: true,
        message: "Mentor Login Successfull",
        user: rest
    })
  };

  //update slot of psychologist  (Aryan's FUNCTION  FOR TRIAL)
const updateSlot = async (req, res) => {
    const { mentorId, date, slots, available } = req.body;
    const schedule = await ScheduleModel.findOne({
        mentorId,
        date,
    });
    if(!schedule) {
      schedule = ScheduleModel.create({
        mentorId,
        date,
      });
    }
    if (available === false) {
      if (!schedule.slots.includes(slots)) {
        schedule.slots.push(slots);
      }
    } else {
        if (schedule && schedule.slots) {
            const index = schedule.slots.indexOf(slots);
            if (index !== -1) {
              schedule.slots.splice(index, 1);
            }
          }
    }
    await schedule.save();
    const responseArray = slotTimings.map((time) => {
      if (schedule && schedule.slots.includes(time)) {
        return {
          time: time,
          available: false,
        };
      } else {
        return {
          time: time,
          available: true,
        };
      }
    });
    return res
      .status(200)
      .json({ 
        success: true,
        msg: "Slot was updated successfully", 
        slots: responseArray });
  };

  module.exports = {
    register,
    verifyEmail,
    login,
    updateSlot
  }