const router = require("express").Router()

const conn = require("../../config/database")
const db = require("../../model/sqlDefine")

/* get All User Data */
router.get("/booking", async (req, res) => {
  const bookingData = {
    price: req.body.first_name,
    deposit: req.body.last_name,
    room_room_id: req.body.email,
    user_user_id: req.body.phone,
    date_check_in: req.body.password,
    date_check_out: req.body.type,
    
  }
  const { first_name, last_name, email, phone, password, type } = userData
  const onCreateBooking = await db.tbBooking
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
