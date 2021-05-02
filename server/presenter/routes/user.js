const express = require("express")
const router = express.Router()

const conn = require("../../config/database")
const db = require("../../model/sqlDefine")


/*get User Data from user_id*/
router.post("/getUser", async (req, res) => {
    const getUser = await db.tbUser.findByPk(req.body.user_id)
    if (getUser === null) {
      res.status(404).send('Not found User');
    } else {
      res.send(getUser);
    }
  })
/*----------------------------------------------------------------------*/


  /*get All User Data*/
  router.post("/getAllUser", async (req, res) => {
    const getAllUser = await db.tbUser.findAll()
    if (getAllUser === null) {
      res.status(404).send('Not found User');
    } else {
      res.send(getAllUser);
    }
  })

  
/*----------------------------------------------------------------------*/

exports.router = router;

