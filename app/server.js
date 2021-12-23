const express = require("express");
const serverless = require("serverless-http");
const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.get("/info", (req, res) => {
    res.status(200).json({application: "sample-serverless-nodejs-app", version:"1"});
});
app.get("/health", (req, res) => {
    res.status(200).json({message: "all ok"});
});
app.get("/", (req, res) => {
    res.status(200).json({message: "I am root"});
});
app.use((req, res) => {
    res.status(404).json({message: "Not Found"});
});

module.exports.handler = serverless(app);
