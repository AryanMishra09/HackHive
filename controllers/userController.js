const MentorModal = require("../models/mentorModel");
const UserModel = require("../models/userModel");
const { SendVerifyEmail } = require("../services/mailingServices");
const { category } = require("../utils/constants");
const { hashPassword, comparePassword } = require("../utils/passwordUtils");
const { createJWT } = require("../utils/tokenUtils");


//User Register
const register = async (req, res, next) => {

    const {username, email, password, imagepath } = req.body;
    try {
      const existingUser = await UserModel.findOne({ email });
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
      const newUser = new UserModel({
        username,
        email,
        password: hashedPassword,
        imagepath,
        token,
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
      const user = await UserModel.findOne({ email: email });
      if(!user){
        return res.status(403).json({
            success: false,
            message: "This email Id is not registered in our app."
        });
      }
    const validUser = await UserModel.findOne({token});
    if(!validUser){
        const deletedUser = await UserModel.deleteOne({ email });
        return res.status(404).json({
            success: false,
            message: 'Invalid OTP Entered. You have to register again!',
        })
    }else{
      const user = await UserModel.findByIdAndUpdate(
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
    const user = await UserModel.findOne({ email: req.body.email });
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
      role: "USER",
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
        message: "User Login Successfull",
        user: rest
    })
};

//get all mentors:
const getAllMentors = async(req, res, next)=>{
  try {
    const mentor = await MentorModal.find({}).select("-password");
    if(!mentor){
      return res.status(403).json({
        success: false,
        message: "No mentors exists!",
      });
    }

    return res.status(200).json({
      success: true,
      mentor,
    });
  } catch (error) {
    return res.status(500).json({
      success: false,
      error: error.message,
    })
  }
}

//get mentors category wise:
const getMentorCategoryWise = async(req, res, next)=>{
  try {
    const knownProfession= (req.query.profession);
    const mentor_category = await MentorModal.find({profession: knownProfession}); 
    if (!mentor_category || mentor_category.length === 0) {
      return res.status(404).json({
        success: false,
        message: "No Professionals in this category!",
      });
    }
    return res.status(200).json({
      success: true,
      mentor_category,
    });
  } catch (error) {
    return res.status(500).json({
      success: false,
      error: error.message,
    })
  }
};

  //get Profile
  const getProfile=async(req, res, next)=>{
    try {
        const id = req.query.id;
        const user = await UserModel.findById({_id : id});
        if(!user){
            return res.status(403).json({
                success: false,
                message: "No Profile with this Id",
            });
        }
        const { password, ...rest} = user._doc;
        return res.status(200).json({
            success: true,
            mentor: rest,
        })
    } catch (error) {
        console.log(error);
        return res.status(500).json({
            success: false,
            message: "Something went wrong",
        });
    }
  }

  
//update mentor profile:
const updateProfile = async( req , res, next) => {

    try {
        const id = req.query.id
      const { username, imagepath } = req.body;
      const updateUser = await UserModel.findByIdAndUpdate({_id : id}, {
        $set: {
          username,
          imagepath,
        }
      }, {new: true});
      const {password, ...rest} = updateUser._doc;
  
      return res
      .status(200)
      .json({
        success: true,
        message: "Profile Updated SuccessFully",
        updatedProfile: rest,
      });
  
    } catch (error) {
      console.log(error);
      return res.status(500).json({
        success: false,
        message: "Something went wrong",
      });
    }
}

  module.exports = {
    register,
    verifyEmail,
    login,
    getAllMentors,
    getMentorCategoryWise,
    getProfile,
    updateProfile,
  }