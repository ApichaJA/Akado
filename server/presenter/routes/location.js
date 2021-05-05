const router = require("express").Router()

const conn = require("../../config/database")
const db = require("../../model/sqlDefine")
const { QueryTypes } = require('sequelize');

/* get Location Data from user_id */
// router.post("/getLocation", async (req, res) => {
//   const getLocation = await db.tbLocation.findByPk(req.body.location_id)
//   if (getLocation === null) {
//     res.status(404).send("Not found Location")
//   } else {
//     res.send(getLocation)
//   }
// })
/* ---------------------------------------------------------------------- */

/* get All Location */
// router.get("/getAllLocation", async (req, res) => {
//   const getAllLocation = await db.tbLocation.findAll()
//   if (getAllLocation === null) {
//     res.status(404).send("Not found All Location")
//   } else {
//     res.send(getAllLocation)
//   }
// })

/* ---------------------------------------------------------------------- */

/* get All Location */

router.get("/getAllLocation", async (req, res) => {
  res.send(await conn.query(
    'SELECT * FROM LOCATION l LEFT OUTER JOIN RATING_LOCATION r\
    ON (l.location_id = r.location_location_id)'
  ));
})


/* ---------------------------------------------------------------------- */

/* get Location from location_id*/

router.post("/getLocation", async (req, res) => {
  res.send(await conn.query(
    'SELECT * FROM LOCATION l LEFT OUTER JOIN RATING_LOCATION r\
    ON (l.location_id = r.location_location_id)\
    WHERE l.location_id = :location_id',
    {
      replacements: { location_id: req.body.location_id },
      type: QueryTypes.SELECT
    }
    ));
})

module.exports = router
