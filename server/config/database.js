const Sequelize = require("sequelize")

const sequelize = new Sequelize("K-Dorm", "root", "P@ssw0rd_IT", {
  host: "167.99.64.208",
  dialect: "mysql",
  define: {
    timestamps: false,
  },
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000,
  },
})

sequelize
  .authenticate()
  .then(() => console.log("Database Connected"))
  .catch((err) => console.log("error: ", err))

sequelize
  .sync()
  .then(() => console.log("Connect Successfully!"))
  .catch((e) => console.error(e))

module.exports = sequelize
