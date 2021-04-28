const express = require("express")
const router = express.Router()

const conn = require("../../config/database")
const db = require("../../model/sqlDefine")

router.get("/", (req, res) => res.send("Akado API"));
  router.get("/select", (req, res) => {
    db.createUser.findAll()
      .then((sel) => {
        console.log(sel)
        res.sendStatus(200)
      })
      .catch((err) => console.log(err))
  }),
  /*Create User*/
  router.get("/createUser", async (req, res) => {
      const userData = {
          first_name: "Apicha",
          last_name: "Junyatanakron",
          type: "member",
    }
    let {first_name, last_name, type} = userData;
    const onCreateUser = await db.createUser.create({
        first_name,
        last_name,
        type
    })
    /*Then Create Role FROM User*/
    if (type === "member") {
      db.createMember
        .create({
          user_user_id: onCreateUser.user_id,
          email: "test",
          phone: "test",
        })
        .then(res.redirect("/api.akado/v1"))
        .catch((err) => console.log(err))
    } else if (type === "admin") {
      db.createAdmin
        .create({
          user_user_id: onCreateUser.user_id,
        })
        .then(res.redirect("/api.akado/v1"))
        .catch((err) => console.log(err))
    }
  })

module.exports = router

