const Router = require("express");
const { register, verifyEmail, login, updateSlot } = require("../controllers/mentorController");
const router = Router();

//User register
router.route("/register").post(register);
//User email verify
router.route("/verify").post(verifyEmail);
//for user login
router.route("/login").post(login);
//for updating slots:
router.route("/updateSlot").post(updateSlot);


module.exports = router;