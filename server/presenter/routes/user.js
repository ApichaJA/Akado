const router = require("express").Router()

const conn = require("../../config/database")
const db = require("../../model/sqlDefine")
const { QueryTypes } = require('sequelize');

/* get User Data from user_id */
router.get("/getUser/:user_id", async (req, res) => {
  const data = await conn.query(
    'SELECT * FROM USER\
    WHERE USER.user_id = :user_id',
    {
      replacements: { user_id: req.params.user_id },
      type: QueryTypes.SELECT
    }
    ).catch(e => res.send(e))

    if (data.length < 1) {
      res.send(false)
    } else {
      res.json(data)
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
