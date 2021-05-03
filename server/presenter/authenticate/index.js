const app = require("express")()
const gateWay = require("./routes/gateway")

app.use(gateWay)

module.exports = app
