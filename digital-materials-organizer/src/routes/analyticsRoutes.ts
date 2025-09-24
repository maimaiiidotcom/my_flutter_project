import { Router } from 'express';
import AnalyticsController from '../controllers/analyticsController';

const router = Router();
const analyticsController = new AnalyticsController();

// Route to get file access statistics
router.get('/file-access/:fileId', analyticsController.getFileAccessStats);

// Route to get overall engagement metrics
router.get('/engagement', analyticsController.getEngagementMetrics);

export default router;