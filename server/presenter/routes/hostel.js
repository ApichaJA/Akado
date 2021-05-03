/* get all hostel */
/* eslint-disable */
const router = require("express").Router()

const conn = require("../../config/database")
const db = require("../../model/sqlDefine")

router.get("/getAllHostel", async (req, res) => {
  const getAllHostel = await db.tbHostel.findAll()
  if (getAllHostel === null) {
    res.status(404).send("Cannot get Hostel")
  } else {
    res.send(getAllHostel)
  }
})

  /* ---------------------------------------------------------------------- */

/* get getOwnerHostel */
router.post("/getOwnerHostel", async (req, res) => {
  const getOwnerHostel = await db.tbHostel.findByPk(req.body.hostel_id)
  if (getOwnerHostel === null) {
    res.status(404).send("Not found Owner Hostel")
  } else {
    res.send(getOwnerHostel)
  }
})

/* ---------------------------------------------------------------------- */

module.exports = router
