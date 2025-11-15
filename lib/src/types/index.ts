export interface User {
    id: string;
    email: string;
    role: 'Teacher' | 'Student' | 'Parent';
}

export interface File {
    id: string;
    name: string;
    type: string; // e.g., 'pdf', 'docx', 'ppt', etc.
    size: number; // in bytes
    uploadedBy: string; // User ID of the uploader
    subject: string;
    topic: string;
    createdAt: Date;
}

export interface Folder {
    id: string;
    name: string;
    parentId?: string; // Optional for nested folders
    createdBy: string; // User ID of the creator
    createdAt: Date;
}

export interface Notification {
    id: string;
    userId: string; // User ID of the recipient
    message: string;
    createdAt: Date;
}

export interface Analytics {
    id: string;
    fileId: string; // ID of the accessed file
    userId: string; // User ID of the student
    accessedAt: Date;
}