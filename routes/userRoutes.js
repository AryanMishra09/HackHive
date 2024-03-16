const Router = require("express");
const { register, verifyEmail } = require("../controllers/userController");
const router = Router();

//User Login
router.route("/register").post(register);
//User email verify
router.route("/verify").post(verifyEmail);


module.exports = router;