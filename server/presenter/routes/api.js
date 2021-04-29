const express = require("express")
const router = express.Router()

const conn = require("../../config/database")
const db = require("../../model/sqlDefine")

router.get("/", (req, res) => res.send("Akado API"));


  /*get User Data from user_id*/
  router.get("/getUser", async (req, res) => {
    const getUser = await db.createUser.findByPk(req.query.user_id)
    if (getUser === null) {
      res.status(404).send('Not found User');
    } else {
      res.send(getUser);
    }
  }),
/*----------------------------------------------------------------------*/


  /*Create User*/
  router.get("/createUser", async (req, res) => {
      const userData = {
          first_name: "Apicha",
          last_name: "Junyatanakron",
          email: 'jun@gmail.com',
          phone: '0925055645',
          type: "member",
    }
    let {first_name, last_name, email, phone, type} = userData;
    const onCreateUser = await db.createUser.create({
        first_name,
        last_name,
        email,
        phone,
        type
    })
    /*Then Create Role FROM User*/
    if (type === "member") {
      db.createMember
        .create({
          user_user_id: onCreateUser.user_id,
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
/*----------------------------------------------------------------------*/


module.exports = router

