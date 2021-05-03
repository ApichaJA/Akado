// Main presenter configuration
/* eslint-disable */
const express = require("express")
const morgan = require("morgan")
const helmet = require("helmet")
const cors = require("cors")
const bodyParser = require("body-parser")

const apiRouter = require("./presenter/routes/api")
const userRouter = require("./presenter/routes/user")
const createUserRouter = require("./presenter/routes/createUser")
const hostelRouter = require("./presenter/routes/hostel")

const app = express()

// Setup Server Port
const PORT = process.env.PORT || 5000

// Use Middleware
app.use(morgan("common"))
app.use(helmet())
app.use(cors())

// Statics
app.use(express.static("static"))
app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

app.use("/api.akado/v1", apiRouter)
app.use("/api.akado/v1", userRouter)
app.use("/api.akado/v1", createUserRouter)
app.use("/api.akado/v1", hostelRouter)

// Listen
app.listen(PORT, () => {
  console.log(`Back-End listening at: ${PORT}`)
})
