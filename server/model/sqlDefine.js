const Seq = require("sequelize")
const conn = require("../config/database")

const tbUser = conn.define(
  "USER",
  {
    user_id: {
      type: Seq.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    first_name: {
      type: Seq.STRING,
    },
    last_name: {
      type: Seq.STRING,
    },
    email: {
      type: Seq.STRING,
    },
    phone: {
      type: Seq.STRING,
    },
    type: {
      type: Seq.STRING,
    },
  },
  {
    freezeTableName: true,
  }
)
tbUser.removeAttribute("id")

const tbMember = conn.define(
  "MEMBER",
  {
    user_user_id: {
      type: Seq.INTEGER,
      primaryKey: true,
    },
  },
  {
    freezeTableName: true,
  }
)
tbMember.removeAttribute("id")

const tbAdmin = conn.define(
  "ADMIN",
  {
    user_user_id: {
      type: Seq.INTEGER,
      primaryKey: true,
    },
  },
  {
    freezeTableName: true,
  }
)
tbAdmin.removeAttribute("id")

const tbHostel = conn.define(
  "HOSTEL",
  {
    hostel_id: {
      type: Seq.INTEGER,
      primaryKey: true,
    },
    name: { type: Seq.STRING },
    phone: { type: Seq.STRING },
    phone_home: { type: Seq.STRING },
    address: { type: Seq.STRING },
    latitude: { type: Seq.DOUBLE },
    longtitude: { type: Seq.DOUBLE },
    min_price: { type: Seq.DOUBLE },
    max_price: { type: Seq.DOUBLE },
    gender: { type: Seq.STRING },
    verify: { type: Seq.STRING }
  },
  {
    freezeTableName: true,
  }
)
tbAdmin.removeAttribute("id")

module.exports = {
  tbUser,
  tbMember,
  tbAdmin,
  tbHostel,
}
