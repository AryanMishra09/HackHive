const Router = require("express");
const { register, verifyEmail, login, getAllMentors, getMentorCategoryWise, getProfile, updateProfile, bookMentor, getBookingHistory } = require("../controllers/userController");
const { generateSession, updateSessionSchedule } = require("../middleware/sessionMiddleware");
const router = Router();

//User register
router.route("/register").post(register);
//User email verify
router.route("/verify").post(verifyEmail);
//for user login
router.route("/login").post(login);
//for getting all mentor list:
router.route("/getMentorList").get(getAllMentors);
//for getting category wise mentor:
router.route("/getMentorListCategorywise").get(getMentorCategoryWise);
//for getting profile:
router.route('/getProfile').get(getProfile);
//for updating profile: 
router.route("/updateProfile").post(updateProfile);

//mentor booking:
router
  .route("/book")
  .post(
    generateSession,
    updateSessionSchedule,
    bookMentor,
  ) 
//get booking history of user
router.route("/getHistory").get(getBookingHistory);

module.exports = router;