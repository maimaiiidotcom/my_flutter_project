export interface FileAccessAnalytics {
    fileId: string;
    studentId: string;
    accessTime: Date;
    action: 'view' | 'download';
}

export interface EngagementMetrics {
    fileId: string;
    totalAccesses: number;
    uniqueStudents: number;
    lastAccessed: Date | null;
}

export class Analytics {
    private accessLogs: FileAccessAnalytics[] = [];
    private engagementMetrics: Record<string, EngagementMetrics> = {};

    logAccess(fileId: string, studentId: string, action: 'view' | 'download'): void {
        const accessEntry: FileAccessAnalytics = {
            fileId,
            studentId,
            accessTime: new Date(),
            action,
        };
        this.accessLogs.push(accessEntry);
        this.updateEngagementMetrics(fileId, studentId);
    }

    private updateEngagementMetrics(fileId: string, studentId: string): void {
        if (!this.engagementMetrics[fileId]) {
            this.engagementMetrics[fileId] = {
                fileId,
                totalAccesses: 0,
                uniqueStudents: 0,
                lastAccessed: null,
            };
        }

        const metrics = this.engagementMetrics[fileId];
        metrics.totalAccesses += 1;
        if (!this.accessLogs.some(log => log.fileId === fileId && log.studentId === studentId)) {
            metrics.uniqueStudents += 1;
        }
        metrics.lastAccessed = new Date();
    }

    getEngagementMetrics(fileId: string): EngagementMetrics | null {
        return this.engagementMetrics[fileId] || null;
    }

    getAccessLogs(): FileAccessAnalytics[] {
        return this.accessLogs;
    }
}