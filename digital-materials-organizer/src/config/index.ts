import dotenv from 'dotenv';

dotenv.config();

const config = {
    PORT: process.env.PORT || 3000,
    DB_URI: process.env.DB_URI || 'mongodb://localhost:27017/digital-materials-organizer',
    JWT_SECRET: process.env.JWT_SECRET || 'your_jwt_secret',
    FILE_SIZE_LIMIT: process.env.FILE_SIZE_LIMIT || '5mb',
    ALLOWED_FILE_TYPES: process.env.ALLOWED_FILE_TYPES ? process.env.ALLOWED_FILE_TYPES.split(',') : ['application/pdf', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/vnd.ms-powerpoint', 'image/jpeg', 'image/png', 'video/mp4'],
};

export default config;