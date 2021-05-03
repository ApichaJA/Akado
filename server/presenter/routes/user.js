const router = require("express").Router()

const conn = require("../../config/database")
const db = require("../../model/sqlDefine")

/* get User Data from user_id */
router.post("/getUser", async (req, res) => {
  const getUser = await db.tbUser.findByPk(req.body.user_id)
  if (getUser === null) {
    res.status(404).send("Not found User")
  } else {
    res.send(getUser)
  }
})
/* ---------------------------------------------------------------------- */

/* get All User Data */
router.get("/getAllUser", async (req, res) => {
  const getAllUser = await db.tbUser.findAll()
  if (getAllUser === null) {
    res.status(404).send("Not found User")
  } else {
    res.send(getAllUser)
  }
})

/* ---------------------------------------------------------------------- */

/* Authenticate */
router.post("/authUser", async (req, res) => {
    const authUser = await db.tbUser.findAll({where: {
        email: req.body.email,
        password: req.body.password
      }
    })
    if (authUser.length < 1) {
      res.status(404).send("Wrong")
    } else {
      res.send(authUser)
    }
  })
  
  /* ---------------------------------------------------------------------- */

module.exports = router
