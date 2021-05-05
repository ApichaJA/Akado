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
    password: {
        type: Seq.STRING,
      },
    type: {
      type: Seq.STRING,
    },
    password: {
      type: Seq.STRING
    }
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
    hostel_hostel_id: {
      type: Seq.INTEGER,
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
      autoIncrement: true,
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
    image: { type: Seq.STRING },
    verify: { type: Seq.TINYINT }
  },
  {
    freezeTableName: true,
  }
)
tbHostel.removeAttribute("id")

const tbLocation = conn.define(
    "LOCATION",
    {
        location_id: {
        type: Seq.INTEGER,
        primaryKey: true,
      },
      name: { type: Seq.STRING },
      address: { type: Seq.STRING },
      latitude: { type: Seq.DOUBLE },
      longtitude: { type: Seq.DOUBLE },
      type: { type: Seq.DOUBLE },
      image: { type: Seq.STRING },
    },
    {
      freezeTableName: true,
    }
  )
  tbLocation.removeAttribute("id")



  const tbRoom = conn.define(
    "ROOM",
    {
      room_id: {
        type: Seq.INTEGER,
        primaryKey: true,
      },
      hostel_hostel_id: { type: Seq.INTEGER },
      room_type_type_id: { type: Seq.INTEGER },
      state: { type: Seq.TINYINT },
    },
    {
      freezeTableName: true,
    }
  )
  tbRoom.removeAttribute("id")


  const tbBooking = conn.define(
    "BOOKING",
    {
      booking_id: {
        type: Seq.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      price: { type: Seq.STRING },
      deposit: { type: Seq.STRING },
      room_room_id: { type: Seq.STRING },
      user_user_id: { type: Seq.STRING },
      date_check_in: { type: Seq.DOUBLE },
      date_check_out: { type: Seq.DOUBLE },
      hostel_name: { type: Seq.DOUBLE }
    },
    {
      freezeTableName: true,
    }
  )
  tbBooking.removeAttribute("id")


  const tbRating_Location = conn.define(
    "RATING_LOCATION",
    {
      rate_id: {
        type: Seq.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      user_user_id: { type: Seq.INTEGER },
      location_location_id: { type: Seq.INTEGER },
      star: { type: Seq.STRING },
      type: { type: Seq.STRING },
      comment: { type: Seq.STRING }
    },
    {
      freezeTableName: true,
    }
  )
  tbRating_Location.removeAttribute("id")



  const tbRating = conn.define(
    "RATING",
    {
      rate_id: {
        type: Seq.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      user_user_id: { type: Seq.INTEGER },
      hostel_hostel_id: { type: Seq.INTEGER },
      star: { type: Seq.STRING },
      type: { type: Seq.STRING },
      comment: { type: Seq.STRING }
    },
    {
      freezeTableName: true,
    }
  )
  tbRating.removeAttribute("id")

module.exports = {
  tbUser,
  tbMember,
  tbAdmin,
  tbHostel,
  tbLocation,
  tbRoom,
  tbBooking,
  tbRating_Location,
  tbRating,
}
