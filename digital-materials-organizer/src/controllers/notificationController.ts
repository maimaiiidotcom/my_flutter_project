import { Request, Response } from 'express';
import NotificationService from '../services/notificationService';

class NotificationController {
    private notificationService: NotificationService;

    constructor() {
        this.notificationService = new NotificationService();
    }

    public async sendNotification(req: Request, res: Response): Promise<Response> {
        const { userId, message } = req.body;

        try {
            await this.notificationService.sendNotification(userId, message);
            return res.status(200).json({ message: 'Notification sent successfully' });
        } catch (error) {
            return res.status(500).json({ error: 'Failed to send notification' });
        }
    }

    public async confirmAccess(req: Request, res: Response): Promise<Response> {
        const { userId, fileId } = req.body;

        try {
            await this.notificationService.confirmAccess(userId, fileId);
            return res.status(200).json({ message: 'Access confirmed' });
        } catch (error) {
            return res.status(500).json({ error: 'Failed to confirm access' });
        }
    }
}

export default NotificationController;