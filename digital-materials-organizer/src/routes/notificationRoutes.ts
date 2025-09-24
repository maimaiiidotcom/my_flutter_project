import { Router } from 'express';
import { NotificationController } from '../controllers/notificationController';

const router = Router();
const notificationController = new NotificationController();

// Route to send notifications to students
router.post('/send', notificationController.sendNotification);

// Route to confirm access for teachers
router.post('/confirm-access', notificationController.confirmAccess);

export default router;