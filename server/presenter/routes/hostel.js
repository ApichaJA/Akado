/* get all hostel */
/* eslint-disable */
const router = require("express").Router()

const conn = require("../../config/database")
const db = require("../../model/sqlDefine")

router.get("/getAllHostel", async (req, res) => {
  const getAllHostel = await db.tbHostel.findAll()
  if (getAllHostel === null) {
    res.status(404).send("Cannot get Hostel")
  } else {
    res.status(200).send(getAllHostel)
  }
})

router.get("/hostel/:id", async (req, res) => {
  const id = req.params.id || ''

  const data = await db.tbHostel.findOne({
    where: {
      hostel_id: id
    }
  }).catch(e => console.error(e))

  if (data) {
    res.status(200).json(data)
  } else {
    res.status(500).send()
  }
})

/* get getOwnerHostel */
router.get("/getOwnerHostel", async (req, res) => {
  const getOwnerHostel = await db.tbHostel.findByPk(req.body.hostel_id)
  if (getOwnerHostel === null) {
    res.status(404).send("Not found Hostel")
  } else {
    res.send(getOwnerHostel)
  }
})

/* ---------------------------------------------------------------------- */

/* get AllRoom */

router.get("/getAllRoom", async (req, res) => {
  const getAllRoom = await db.tbRoom.findAll()
  if (getAllRoom === null) {
    res.status(404).send("Cannot get Hostel")
  } else {
    res.send(getAllRoom)
  }
})

/* ---------------------------------------------------------------------- */

/* get Room from hostel_id */
router.post("/getRoom", async (req, res) => {
  const getRoom = await db.tbRoom.findAll({
    where: {
      hostel_hostel_id: req.body.hostel_id,
    },
  })
  if (getRoom === null) {
    res.status(404).send("Not found Owner Hostel")
  } else {
    res.send(getRoom)
  }
})

/* ---------------------------------------------------------------------- */

/* create HOSTEL */
router.post("/createHostel", async (req, res) => {
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
