import { Request, Response } from 'express';
import { AnalyticsService } from '../services/analyticsService';

export class AnalyticsController {
    private analyticsService: AnalyticsService;

    constructor() {
        this.analyticsService = new AnalyticsService();
    }

    public async getFileAccessStats(req: Request, res: Response): Promise<void> {
        try {
            const fileId = req.params.fileId;
            const stats = await this.analyticsService.getFileAccessStats(fileId);
            res.status(200).json(stats);
        } catch (error) {
            res.status(500).json({ message: 'Error retrieving file access statistics', error });
        }
    }

    public async getEngagementMetrics(req: Request, res: Response): Promise<void> {
        try {
            const metrics = await this.analyticsService.getEngagementMetrics();
            res.status(200).json(metrics);
        } catch (error) {
            res.status(500).json({ message: 'Error retrieving engagement metrics', error });
        }
    }
}