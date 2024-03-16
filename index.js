const express = require('express');
const dotenv = require("dotenv");
dotenv.config();
const app = express();
const connectDB = require("./db/connect.js");
const morgan = require("morgan");
const body_parser = require("body-parser");

const PORT = process.env.PORT || 3000;
const cookie = require("cookie-parser");
const cors = require("cors");
app.use(morgan("dev"));

const userRouter = require("./routes/userRoutes.js");

app.get("/test", (req, res) => {
    res.send("Hi I am live ");
  });

app.use(cookie());
app.use(body_parser.json());

app.use("/api/user/", userRouter);

  const start = async () => {
    try {
      await connectDB();
      app.listen(PORT, () => {
        console.log("Conneced to the port : " + PORT);
      });
    } catch (error) {
      console.log(error);
    }
  };
  start();
