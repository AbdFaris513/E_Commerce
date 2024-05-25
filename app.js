const express = require("express");
const expressValidator = require("express-validator");
const bodyParser = require("body-parser");
const morgan = require("morgan");
const cros = require("cors");
const cookieParser = require("cookie-parser");

const app = express();
const { users, order } = require("./routes/index");
app.use(bodyParser.json());
app.use((req, res, next) => {
  res.setHeader("Access-Control-Allow-Orgin", "*");
  res.setHeader("Access-Control-Allow-Credentials", true);
  res.setHeader(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  res.setHeader(
    "Access-Control-Allow-Methods",
    "GET, POST, PATCH, PUT, DELETE, OPRIONS"
  );
  next();
});
// app.use(expressValidator.check);
app.use(morgan("dev"));
app.use(cros());
app.use(cookieParser());

const port = 3100;
app.use("/api/v1", users);
app.use("/api/v1", order);
app.listen(port, () => {
  console.log(`App running on ${port}`);
});
