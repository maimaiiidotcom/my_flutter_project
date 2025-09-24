export interface Notification {
    id: string;
    userId: string;
    message: string;
    timestamp: Date;
    isRead: boolean;
}