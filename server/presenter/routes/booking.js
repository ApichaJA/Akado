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
  const onCreateBooking = await db.tbBooking
    .create({
      price,
      deposit,
      room_room_id,
      user_user_id,
      date_check_in,
      date_check_out,
    })
    .then(res.status(201))
    .catch((err) => res.send("Field blank"))
  /* Then Create Role FROM User */
  if (onCreateBooking) {
      res.send('Booking Success')
  }
  else{
    res.send('Booking Fail')
  }
  db.tbRoom.update(
    { state: true },
    { where: { room_id: room_room_id } }
  )
    .then(result =>
      res.send(result)
    )
    .catch(err =>
      res.send(err)
    )
})

/* ---------------------------------------------------------------------- */

module.exports = router
