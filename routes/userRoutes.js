const Router = require("express");
const { register, verifyEmail, login, getAllMentors } = require("../controllers/userController");
const router = Router();

//User register
router.route("/register").post(register);
//User email verify
router.route("/verify").post(verifyEmail);
//for user login
router.route("/login").post(login);
//for getting all mentor list:
router.route("/getMentorList").get(getAllMentors);


module.exports = router;