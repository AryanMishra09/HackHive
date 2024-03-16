const jwt = require("jsonwebtoken");

module.exports.createJWT = (payload) => {
  const token = jwt.sign(payload, process.env.JWT_SECRET, {
  //const token = jwt.sign({data:'olala'}, 'secrethai', {
    expiresIn: "1d",
  });
  return token;
};