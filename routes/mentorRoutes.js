const Router = require("express");
const { register, verifyEmail, login, updateSchedule, getSchedule, getProfile, updateProfile, getHistory } = require("../controllers/mentorController");
const router = Router();

//User register
router.route("/register").post(register);
//User email verify
router.route("/verify").post(verifyEmail);
//for user login
router.route("/login").post(login);
//for updating slots:
router.route("/updateSlot").post(updateSchedule);
//for getting slots:
router.route("/getSlot").get(getSchedule);
//for getting profile:
router.route('/getProfile').get(getProfile);
//for updating profile: 
router.route("/updateProfile").post(updateProfile);
//getHistory
router.route("/getHistory").get(getHistory);


module.exports = router;