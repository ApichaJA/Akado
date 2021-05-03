const router = require("express").Router()

const conn = require("../../config/database")
const db = require("../../model/sqlDefine")

/* get Location Data from user_id */
router.post("/getLocation", async (req, res) => {
  const getLocation = await db.tbLocation.findByPk(req.body.location_id)
  if (getLocation === null) {
    res.status(404).send("Not found Location")
  } else {
    res.send(getLocation)
  }
})
/* ---------------------------------------------------------------------- */

/* get All Location */
router.get("/getAllLocation", async (req, res) => {
  const getAllLocation = await db.tbLocation.findAll()
  if (getAllLocation === null) {
    res.status(404).send("Not found All Location")
  } else {
    res.send(getAllLocation)
  }
})

/* ---------------------------------------------------------------------- */

module.exports = router
