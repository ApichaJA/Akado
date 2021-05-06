const jwt = require("jsonwebtoken")

function authenticateUser (req, res, next) {
  const KEY = process.env.SECRET_TOKEN || null
  const token = req.headers.authorization

  if (!token) return res.sendStatus(401)

  const accessToken = token.split(" ")[1]

  jwt.verify(accessToken, KEY, (err, user) => {
    if (err) return res.sendStatus(403)

    req.user = user.user
    req.userDetail = user.userDetail

    next()
  })
}

module.exports = authenticateUser
