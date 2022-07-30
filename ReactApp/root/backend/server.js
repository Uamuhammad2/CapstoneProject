const express = require("express");
const cors = require("cors");

const API_PORT = process.env.PORT || 5000;
const app = express();

app.use(cors());

app.get("/test", function (request, response) {
  console.log("called");
  response.send({ result: "test was called" });
});

app.listen(API_PORT, () => console.log("Listening on port " + API_PORT));
