import { Analytics } from '../models/analytics';

export class AnalyticsService {
    private analyticsModel: typeof Analytics;

    constructor() {
        this.analyticsModel = Analytics;
    }

    async recordFileAccess(fileId: string, userId: string): Promise<void> {
        const accessRecord = new this.analyticsModel({
            fileId,
            userId,
            accessedAt: new Date(),
        });
        await accessRecord.save();
    }

    async getFileAccessCount(fileId: string): Promise<number> {
        const accessCount = await this.analyticsModel.countDocuments({ fileId });
        return accessCount;
    }

    async getUserFileAccess(userId: string): Promise<any[]> {
        const userAccessRecords = await this.analyticsModel.find({ userId });
        return userAccessRecords;
    }
}