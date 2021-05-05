/* eslint-disable */
const router = require("express").Router()
const jwt = require("jsonwebtoken")
const conn = require("../../../config/database")
const db = require("../../../model/sqlDefine")
const { Op } = require("sequelize");

const KEY = process.env.SECRET_TOKEN || null

const generateUserToken = (account) => {
  console.log(1);
  return jwt.sign({ user: account.email, type: account.type }, KEY, {
    expiresIn: 86400,
  })
}

function authenticateUser(req, res, next) {
  // const authHeader = req.headers["x-access-token"]
  const token = req.headers["authorization"]
  console.log(token);
  if (!token) return res.sendStatus(401)

  const accessToken = token.split(' ')[1]

  jwt.verify(accessToken, KEY, (err, user) => {
    console.log(err)

    if (err) return res.sendStatus(403)

    req.user = user.user

    next()
  })
}

// get user
router.get("/profile", authenticateUser, (req, res) => {
  res.send(req.user)
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
