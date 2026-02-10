const { Sequelize, DataTypes } = require('sequelize');
const bcrypt = require('bcryptjs');

const dbConfig = {
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD !== undefined ? process.env.DB_PASSWORD : '',
    database: process.env.DB_NAME || 'e_test',
    port: process.env.DB_PORT || 3306
};

const sequelize = new Sequelize(dbConfig.database, dbConfig.user, dbConfig.password, {
    host: dbConfig.host,
    dialect: 'mysql',
    logging: false,
    port: dbConfig.port
});

const User = sequelize.define('User', {
    name: { type: DataTypes.STRING, allowNull: false },
    email: { type: DataTypes.STRING, allowNull: false, unique: true },
    password: { type: DataTypes.STRING, allowNull: false },
    role: { type: DataTypes.ENUM('admin', 'student'), defaultValue: 'student' }
});

(async () => {
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');

        const users = await User.findAll();
        console.log('Users found:', users.length);
        for (const user of users) {
            console.log(`User: ${user.email}, ${user.role}, ID: ${user.id}`);
            // Verify default password
            const expectedPass = user.role === 'admin' ? 'admin123' : 'student123';
            const valid = await bcrypt.compare(expectedPass, user.password);
            console.log(`Password matches default (${expectedPass}): ${valid}`);
        }

    } catch (error) {
        console.error('Unable to connect to the database:', error);
    } finally {
        await sequelize.close();
    }
})();
