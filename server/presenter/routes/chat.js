const router = require("express").Router()
const authenticateUser = require("../authenticate/routes/auth")


const conn = require("../../config/database")
const db = require("../../model/sqlDefine")
const { QueryTypes } = require('sequelize');
/* get All User Data */
router.get("/getChat/:aid", authenticateUser, async (req, res) => {
    const uid = req.userDetail.user_id
    const data = await conn.query(
        'SELECT * FROM CHAT_SUPPORT cs LEFT OUTER JOIN CHAT_LOG cl\
        ON (cs.chat_id = cl.id_chat_log)\
        JOIN HOSTEL h\
        ON (cs.admin_user_id = h.admin_id)\
        WHERE cs.user_user_id = :user_id AND cs.admin_user_id = :admin_user_id',
        {
          replacements: { 
              user_id: uid,
              admin_user_id: req.params.aid
             },
          type: QueryTypes.SELECT
        }
        ).catch(e => res.send(e))
    
        if (data.length < 1) {
          res.status(404).send('Not Found')
        } else {
          res.status(200).json(data)
        }
})

router.post("/insertChat", authenticateUser, async (req, res) => {
    const data = await conn.query(
        'INSERT INTO CHAT_LOG (id_chat_log, message, role)\
        VALUE (:id_chat_log, :message, :role)',
        {
          replacements: {
              id_chat_log: req.body.data.id_chat_log,
              message: req.body.data.message,
              role: req.userDetail.type
         },
          type: QueryTypes.SELECT
        }
        ).catch(e => res.send(e))
    
        if (data.length < 1) {
          res.status(404).send('Not Found')
        } else {
          res.status(200).json(data.data)
        }
})

router.get("/getChatList", authenticateUser, async (req, res) => {
    const uid = req.userDetail.user_id
    const data = await conn.query(
        'SELECT * FROM CHAT_SUPPORT\
        WHERE user_user_id = :user_id',
        {
          replacements: { user_id: uid},
          type: QueryTypes.SELECT
        }
        ).catch(e => res.send(e))
            if (data.length < 1) {
          res.send('Not Found')
        } else {
          res.json(data)
        }
})

/* ---------------------------------------------------------------------- */

module.exports = router
