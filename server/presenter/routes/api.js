const express = require("express")
const router = express.Router()

const conn = require("../../config/database")
const db = require("../../model/sqlDefine")

router.post("/", (req, res) => res.send("Akado API"));

exports.router = router;


