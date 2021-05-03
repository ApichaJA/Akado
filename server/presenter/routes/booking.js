const router = require("express").Router()

const conn = require("../../config/database")
const db = require("../../model/sqlDefine")

/* get All User Data */
router.get("/bookroom", async (req, res) => {
  const getAllUser = await db.tbUser.findAll()
  if (getAllUser === null) {
    res.status(404).send("Not found User")
  } else {
    res.send(getAllUser)
  }
})

/* ---------------------------------------------------------------------- */

module.exports = router
