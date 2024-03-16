const mongoose = require("mongoose");


uri =
  "mongodb+srv://mishraaryan9204:Aryan*009@mentorapp.0idxpoa.mongodb.net/appDB";
 
const connectDB = async () => {
  try {
    console.log("Connecting to the Database");
    const obj = await mongoose.connect(uri);
    console.log("connected to MongoDB");
    return obj;
  } catch (error) {
    console.log(error);
    return error;
  }
};
module.exports = connectDB;
