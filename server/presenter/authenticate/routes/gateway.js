/* eslint-disable */
const router = require("express").Router()
const jwt = require("jsonwebtoken")
const conn = require("../../../config/database")
const db = require("../../../model/sqlDefine")
const { Op } = require("sequelize");

const authenticateUser = require('./auth')

const KEY = process.env.SECRET_TOKEN || null

const generateUserToken = (account) => {
  return jwt.sign({ user: account.email, userDetail: account, type: account.type }, KEY, {
    expiresIn: 86400,
  })
}

// get user
router.get("/callback", authenticateUser, (req, res) => {
  res.json(req.user)
})

router.get("/profile", authenticateUser, (req, res) => {
  res.json(req.userDetail)
})

router.post("/login", async (req, res) => {
  const { email, password } = req.body.account

  const hasUser = await db.tbUser
    .findOne({
      where: {
        [Op.and]: [{ email: email }, { password: password }]
      },
      attributes: ['first_name', 'last_name', 'email', 'phone', 'type']
    })
    .catch((e) => console.error(e))

  if (hasUser) {
    const token = generateUserToken(hasUser)

    res.status(200).json({
      user: hasUser,
      accessToken: token
    })
  } else {
    res.status(401).send({
      accessToken: null,
      message: "Invalid Email or Password!"
    });
  }
})

router.get("/logout", (req, res) => {
  res.redirect("/")
})

router.post("/register", (req, res) => {})

module.exports = router
