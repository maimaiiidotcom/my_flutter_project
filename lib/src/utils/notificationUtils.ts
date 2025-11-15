import { Notification } from '../models/notification';

export const formatNotification = (notification: Notification): string => {
    return `${notification.title}: ${notification.message}`;
};

export const sendNotification = (recipient: string, notification: Notification): void => {
    // Logic to send notification to the recipient (e.g., email, push notification)
    console.log(`Sending notification to ${recipient}: ${formatNotification(notification)}`);
};

export const notifyStudentsOfNewMaterial = (students: string[], materialTitle: string): void => {
    students.forEach(student => {
        const notification: Notification = {
            title: 'New Material Available',
            message: `New material titled "${materialTitle}" has been uploaded.`
        };
        sendNotification(student, notification);
    });
};

export const confirmAccessForTeacher = (teacher: string, materialTitle: string): void => {
    const notification: Notification = {
        title: 'Material Access Confirmed',
        message: `Students have accessed the material titled "${materialTitle}".`
    };
    sendNotification(teacher, notification);
};