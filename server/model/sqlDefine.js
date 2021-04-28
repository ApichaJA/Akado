const Seq = require('sequelize');
const conn = require('../config/database');

const createUser = conn.define('USER', {
    user_id: {
        type: Seq.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    first_name:{
        type: Seq.STRING
    },
    last_name: {
        type: Seq.STRING
    },
    type:{
        type: Seq.STRING
    },
},{
    freezeTableName: true,
})
createUser.removeAttribute('id');

const createMember = conn.define('MEMBER', {
    user_user_id:{
        type: Seq.INTEGER,
        primaryKey: true
    },
    email: {
        type: Seq.STRING
    },
    phone:{
        type: Seq.STRING
    },
},{
    freezeTableName: true,
})
createMember.removeAttribute('id');

const createAdmin = conn.define('ADMIN', {
    user_user_id:{
        type: Seq.INTEGER,
        primaryKey: true
    },
},{
    freezeTableName: true,
})
createAdmin.removeAttribute('id');



module.exports = {
    createUser,
    createMember,
    createAdmin
};