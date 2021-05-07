const router = require("express").Router()

const conn = require("../../config/database")
const db = require("../../model/sqlDefine")
const { QueryTypes } = require('sequelize');

const authenticateUser = require("../authenticate/routes/auth")

db.tbUser.hasMany(db.tbBooking, { foreignKey: "user_user_id" })
db.tbBooking.belongsTo(db.tbUser, { foreignKey: "user_user_id" })
db.tbBooking.belongsTo(db.tbRoom, { foreignKey: "room_room_id" })
db.tbHostel.hasMany(db.tbRoom, { foreignKey: "hostel_hostel_id" })
db.tbRoom.belongsTo(db.tbHostel, { foreignKey: "hostel_hostel_id" })

/* get All User Data */
router.post("/booking", async (req, res) => {
  const bookingData = {
    price: req.body.first_name,
    deposit: req.body.last_name,
    room_room_id: req.body.email,
    user_user_id: req.body.phone,
    date_check_in: req.body.checkInDate,
    date_check_out: req.body.ChaekOutDate,
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
    res.send("Booking Success")
  } else {
    res.send("Booking Fail")
  }
  db.tbRoom
    .update({ state: true }, { where: { room_id: room_room_id } })
    .then((result) => res.send(result))
    .catch((err) => res.send(err))
})

router.get("/booking/:id", async (req, res) => {})

router.get("/booking", authenticateUser, async (req, res) => {
    try {
      const uid = req.userDetail.user_id
      const data = await conn.query(
        'SELECT * FROM BOOKING b JOIN\
        ROOM r\
        ON b.room_room_id = r.room_id\
        JOIN HOSTEL h\
        ON r.room_id = h.hostel_id\
        WHERE b.user_user_id = :user_id',
        {
          replacements: { user_id: uid},
          type: QueryTypes.SELECT
        }
        )
  
      console.log(data)
  
      res.json(data)
    } catch (e) {
      res.send(e)
    }
  })
// router.get("/booking", authenticateUser, async (req, res) => {
//   try {
//     const uid = req.userDetail.user_id
//     const data = await db.tbBooking.findAll({
//       where: {
//         user_user_id: uid
//       },
//       include: [db.tbRoom]
//     })

//     console.log(data)

//     res.json(data)
//   } catch (e) {
//     res.send(e)
//   }
// })

/* ---------------------------------------------------------------------- */

module.exports = router
