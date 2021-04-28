const Sequelize = require('sequelize');

module.exports = new Sequelize('K-Dorm', 'japanapi', 'Japan_62070216', {
    host: '167.99.64.208',
    dialect: 'mysql',
    define: {
        timestamps: false
      },
    pool:{
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000,
    },
})