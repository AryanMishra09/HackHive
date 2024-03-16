const UserModel = require("../models/userModel");
const { hashPassword } = require("../utils/passwordUtils");


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

  module.exports = {
    register
  }