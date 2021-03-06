//Main presenter configuration
const app = require('express')();
const morgan = require("morgan");
const helmet = require("helmet");
const cors = require("cors");
const bodyParser = require("body-parser")
const hotelJson = require("../model/json/72572")

//Setup Server Port
const PORT = process.env.PORT || 5000

//Use Middleware
app.use(morgan("common"))
app.use(helmet())
app.use(cors())

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

// Define routes
app.get("/", (req, res) => {
   res.json(hotelJson.Reviews) 
})

// Listen
app.listen(PORT, () => {
    console.log(`Back-End Run On PORT: ${PORT}`);
});