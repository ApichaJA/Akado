const router = require("express").Router()

const conn = require("../../config/database")
const db = require("../../model/sqlDefine")

/* Create User */
router.post("/createUser", async (req, res) => {
  const userData = {
    first_name: req.body.first_name,
    last_name: req.body.last_name,
    email: req.body.email,
    phone: req.body.phone,
    password: req.body.password,
    type: req.body.type,
  }
  const { first_name, last_name, email, phone, password, type } = userData
  const onCreateUser = await db.tbUser
    .create({
      first_name,
      last_name,
      email,
      phone,
      password,
      type,
    })
    .then(res.status(201))
    .catch((err) => res.send("Field blank"))
  /* Then Create Role FROM User */
  if (type === "member" || !type) {
    db.tbMember
      .create({
        user_user_id: onCreateUser.user_id,
      })
      .then(res.redirect("/api.akado/v1/"))
      .catch((err) => res.send(err))
  } else if (type === "admin") {
    db.tbAdmin
      .create({
        user_user_id: onCreateUser.user_id,
      })
      .then(res.redirect("/api.akado/v1/"))
      .catch((err) => res.send(err))
  }
})
/* ---------------------------------------------------------------------- */

module.exports = router
