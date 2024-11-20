const express = require('express');
const mysql = require('mysql2/promise');

const app = express();

const dbConfig = {
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
};

app.get('/', async (req, res) => {
    try {
        const connection = await mysql.createConnection(dbConfig);
        await connection.end();
        res.send('Database connection successful!');
    } catch (error) {
        res.send('Database connection failed: ' + error.message);
    }
});

app.listen(3000, () => {
    console.log('Server running on port 3000');
});