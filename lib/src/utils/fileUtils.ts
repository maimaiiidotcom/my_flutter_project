import { Request } from 'express';

const MAX_FILE_SIZE = 5 * 1024 * 1024; // 5 MB
const ALLOWED_FORMATS = ['application/pdf', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/vnd.ms-powerpoint', 'image/jpeg', 'image/png', 'video/mp4'];

export const validateFileSize = (file: Express.Multer.File): boolean => {
    return file.size <= MAX_FILE_SIZE;
};

export const validateFileFormat = (file: Express.Multer.File): boolean => {
    return ALLOWED_FORMATS.includes(file.mimetype);
};

export const extractFileDetails = (req: Request): { title: string; subject: string; topic: string } => {
    const { title, subject, topic } = req.body;
    return { title, subject, topic };
};