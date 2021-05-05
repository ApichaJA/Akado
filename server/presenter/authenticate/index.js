const app = require("express")()
const gateWay = require("./routes/gateway")

app.use((req, res, next) => {
  res.header(
    "Access-Control-Allow-Headers",
    "x-access-token, Origin, Content-Type, Accept"
  )
  next()
})

app.use(gateWay)

module.exports = app
