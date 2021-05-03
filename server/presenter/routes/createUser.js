const router = require("express").Router()

const conn = require("../../config/database")
const db = require("../../model/sqlDefine")

/* Create User */
router.post("/createUser", async (req, res) => {
  const userData = {
    first_name: "Apichaddddd",
    last_name: "Junyatanakron",
    email: "jun@gmail.com",
    phone: "0925055645",
    type: "admin",
  }
  const { first_name, last_name, email, phone, type } = userData
  const onCreateUser = await db.tbUser
    .create({
      first_name,
      last_name,
      email,
      phone,
      type,
    })
    .then(res.status(201))
    .catch((err) => console.log(err))
  /* Then Create Role FROM User */
  if (type === "member") {
    db.tbMember
      .create({
        user_user_id: onCreateUser.user_id,
      })
      .then(res.redirect("/api.akado/v1"))
      .catch((err) => console.log(err))
  } else if (type === "admin") {
    db.tbAdmin
      .create({
        user_user_id: onCreateUser.user_id,
      })
      .then(res.redirect("/api.akado/v1"))
      .catch((err) => console.log(err))
  }
})
/* ---------------------------------------------------------------------- */

module.exports = router
