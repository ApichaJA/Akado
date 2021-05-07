const router = require("express").Router()

const conn = require("../../config/database")
const db = require("../../model/sqlDefine")

/* Create User */
router.post("/createUser", async (req, res) => {
  const userData = {
    first_name: req.body.data.first_name,
    last_name: req.body.data.last_name,
    email: req.body.data.email,
    phone: req.body.data.phone,
    password: req.body.data.password,
    type: req.body.data.type,
  }
  const { first_name, last_name, email, phone, password, type } = userData
  const check_duplicate  = await db.tbUser.findAll({
    where: {
      email: email
    }
  })
  if(check_duplicate.length > 0){
    res.send({
      message:'this email already use!',
      duplicate: true
  })
  }
    else {
    const onCreateUser = await db.tbUser
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
      .then(res.status(201))
      .catch((err) => res.send(err))
  } else if (type === "admin") {
    db.tbAdmin
      .create({
        user_user_id: onCreateUser.user_id,
      })
      .then(res.status(201))
      .catch((err) => res.send(err))
  }
  res.send({
    message:'Create Success',
    duplicate: false
})
}
})
/* ---------------------------------------------------------------------- */

module.exports = router
