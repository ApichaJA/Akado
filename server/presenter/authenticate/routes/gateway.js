/* eslint-disable */
const router = require("express").Router()
const jwt = require("jsonwebtoken")
const conn = require("../../../config/database")
const db = require("../../../model/sqlDefine")

const KEY = process.env.SECRET_TOKEN || null

const generateUserToken = (username) => {
  return jwt.sign({ user: username }, KEY, {
    expiresIn: "24h",
  })
}

function authenticateUser(req, res, next) {
  const authHeader = req.headers.Authorization || req.cookies.token
  const token = authHeader || null
  console.log(token)
  if (token === null) return res.sendStatus(401)

  jwt.verify((token, KEY), (err, user) => {
    console.log(err)

    if (err) return res.sendStatus(403)

    req.user = user

    next()
  })
}

// get user
router.get("/profile", authenticateUser, (req, res) => {
  // mres.setHeader("Authorization", req.cookies.token)
  res.send(req.user)
})

router.post("/login", async (req, res) => {
  const { email, password } = req.body.account

  const hasUser = await db.tbUser
    .findOne({}, (user) => {
      return user.email === email && user.password === password
    })
    .catch((e) => console.error(e))

  if (hasUser) {
    const accessToken = generateUserToken(hasUser.email)

    res.cookie("token", accessToken, { httpOnly: true })
    res.setHeader("Authorization", accessToken)
    res.send(accessToken)
  } else {
    res.status(401).send("Incorrect email or password")
  }
})

router.get("/logout", (req, res) => {
  res.cookie("token", {}, { maxAge: -1 })
  res.redirect("/")
})

router.post("/register", (req, res) => {})

module.exports = router
