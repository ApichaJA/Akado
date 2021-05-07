/* get all hostel */
/* eslint-disable */
const router = require("express").Router()

const authenticateUser = require("../authenticate/routes/auth")

const conn = require("../../config/database")
const db = require("../../model/sqlDefine")
const { QueryTypes } = require('sequelize');


router.get("/getAllHostel", async (req, res) => {
  const getAllHostel = await db.tbHostel.findAll()
  if (getAllHostel === null) {
    res.status(404).send("Cannot get Hostel")
  } else {
    res.staturouter.get("/getRoom/:id", async (router.get("/getHostel/:id", async (req, res) => {
  const data = await conn.query(
    'SELECT * FROM HOSTEL h LEFT OUTER JOIN RATING r\
    ON (h.hostel_id = r.hostel_hostel_id)\
    WHERE h.hostel_id = :hostel_id',
    {
      replacements: { hostel_id: req.params.id },
      type: QueryTypes.SELECT
    }
    ).catch(e => res.send(e))

    if (data.length < 1) {
      res.status(404).send()
    } else {
      res.status(200).json(data[0])
    }
})  }
}))
    }
})

/* ---------------------------------------------------------------------- */

/* get AllRoom */

router.get("/getAllRoom", async (req, res) => {
  const getAllRoom = await db..id
    }
  })
  if (getAllRoom === null) {
    res.status(404).send("Cannot get Hostel")
  } else {
    res.send(getAllRoom)
  }
})

/* ---------------------------------------------------------------------- */

/* get Room from hostel_id */
router.get("/getFurniture/:room_id", async (req, res) => {
  res.send(
    await conn.query(
      "SELECT * FROM ROOM_FURNITURE rf right OUTER JOIN FURNITURE f\
      ON (rf.furniture_furniture_id = f.furniture_id)\
      WHERE rf.room_room_id = :room_id",
      {
        replacements: { room_id: req.params.room_id },
        type: QueryTypes.SELECT,
      }
    )
  )
})


/* ---------------------------------------------------------------------- */

/* get Room from hostel_id */

/* ---------------------------------------------------------------------- */

/* create HOSTEL */
router.post("/createHostel", authenticateUser, async (req, res) => {
  const hostelData = {
    name: req.body.name,
    phone: req.body.phone,
    phone_home: req.body.phone_home,
    address: req.body.address,
    latitude: req.body.latitude,
    longtitude: req.body.longtitude,
    min_price: req.body.min_price,
    max_price: req.body.max_price,
    gender: req.body.gender,
    image: req.body.image,
  }
  const {
    name,
    phone,
    phone_home,
    address,
    latitude,
    longtitude,
    min_price,
    max_price,
    gender,
    image,
  } = hostelData
  const onCreateHT = await db.tbHostel
  .create({
    name,
    phone,
    phone_home,
    address,
    latitude,
    longtitude,
    min_price,
    max_price,
    gender,
    image,
  })
    .then(res.status(201))
    .catch((err) => {
        res.send(err)
    })
    db.tbAdmin
    .update({hostel_hostel_id: onCreateHT.hostel_id}, {
      where: {
        user_user_id: req.body.user_id
        }
    })
    .then(res.send(onCreateHT))
    .catch((err) => res.send(err))
})

/* ---------------------------------------------------------------------- */

module.exports = router
