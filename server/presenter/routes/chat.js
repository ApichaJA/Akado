const router = require("express").Router()
const authenticateUser = require("../authenticate/routes/auth")

const conn = require("../../config/database")
const db = require("../../model/sqlDefine")
const { QueryTypes } = require('sequelize');
/* get All User Data */
router.get("/getChat/:user_id", async (req, res) => {
    const data = await conn.query(
        'SELECT * FROM CHAT_SUPPORT cs LEFT OUTER JOIN CHAT_LOG cl\
        ON (cs.chat_id = cl.id_chat_log)\
        WHERE cs.user_user_id = :user_id',
        {
          replacements: { user_id: req.params.user_id },
          type: QueryTypes.SELECT
        }
        ).catch(e => res.send(e))
    
        if (data.length < 1) {
          res.status(404).send('Not Found')
        } else {
          res.status(200).json(data)
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
          res.status(404).send('Not Found')
        } else {
          res.status(200).json(data)
        }
})

/* ---------------------------------------------------------------------- */

module.exports = router
