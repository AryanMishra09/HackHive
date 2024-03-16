const Router = require("express");
const { register } = require("../controllers/userController");
const router = Router();

//User Login
router.route("/register").post(register);


module.exports = router;