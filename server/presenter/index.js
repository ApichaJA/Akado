//Main presenter configuration
const express = require('express');
const morgan = require("morgan");
const helmet = require("helmet");
const cors = require("cors");
const bodyParser = require("body-parser")
const hotelJson = require("../model/json/72572")

const conn = require('../config/database');

const app = express();

conn.authenticate()
    .then(() => console.log('Database Connected'))
    .catch(() => console.log('error: ', err))

//Setup Server Port
const PORT = process.env.PORT || 5000

//Use Middleware
app.use(morgan("common"))
app.use(helmet())
app.use(cors())

// Statics
app.use(express.static('static'))
app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded


// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

// Define routes
app.get("/", (req, res) => {
   res.json(hotelJson.Reviews) 
})

const apiRouter = require('./routes/api')
const userRouter = require('./routes/user')
const createUserRouter = require('./routes/createUser')
const hostelRouter = require('./routes/hostel')


app.use('/api.akado/v1', apiRouter.router)
app.use('/api.akado/v1', userRouter.router)
app.use('/api.akado/v1', createUserRouter.router)
app.use('/api.akado/v1', hostelRouter.router)

// Listen
app.listen(PORT, () => {
    console.log(`Back-End listening at: ${PORT}`);
});