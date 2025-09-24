import express from 'express';
import bodyParser from 'body-parser';
import cors from 'cors';
import { authRoutes } from './routes/authRoutes';
import { fileRoutes } from './routes/fileRoutes';
import { notificationRoutes } from './routes/notificationRoutes';
import { organizationRoutes } from './routes/organizationRoutes';
import { analyticsRoutes } from './routes/analyticsRoutes';
import { connectDB } from './config/index';

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Database connection
connectDB();

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/files', fileRoutes);
app.use('/api/notifications', notificationRoutes);
app.use('/api/organization', organizationRoutes);
app.use('/api/analytics', analyticsRoutes);

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});