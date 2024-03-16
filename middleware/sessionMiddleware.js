const SessionModel = require("../models/SessionModel");
const ScheduleModel = require("../models/scheduleModel");
const UserModel = require("../models/userModel");


//generates a session and adds the session Id to the request
module.exports.generateSession = async (req, res, next) => {
    try {
      const { mentorId, userId, date, meetLink, slot } = req.body;

      const session = await SessionModel.create({
        mentorId,
        userId,
        date,
        meetLink,
        slot,
      });
      req.body.sessionId = session._id;
      next();
    } catch (error) {
      return res.status(500).json({ 
        success: false,
        message: "Something went wrong in generating Session for you!"
    });
    }
};


//updates the schedule for the Mentor and the user according to the session details
module.exports.updateSessionSchedule = async (req, res, next) => {
    const { userId, mentorId, sessionId, date, slot } = req.body;
  
    try {
      const user = await UserModel.findById({_id : userId});
    //   console.log("user: ",user)
      user.sessions.push(sessionId);
      await user.save();
  
      const schedule = await ScheduleModel.findOne({
        mentorId,
        date,
      });
      if (!schedule) {
        schedule = await ScheduleModel({
          psychologistId: psychologistId,
          date: date,
          slots: slot 
        });
        await schedule.save();
      }
  
      if (schedule.slots.includes(slot)) {
        const index = schedule.slots.indexOf(slot);
        schedule.slots.splice(index, 1);
      }
  
      await schedule.save();
      next();
    } catch (error) {
        console.log("error message: ",error)
      return res.status(500).json({
        success: false,
        message: "Something went wrong in Update Middleware!"
      })
    }
};