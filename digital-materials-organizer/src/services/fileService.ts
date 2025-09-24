import { File } from '../models/file';
import { Folder } from '../models/folder';

export class FileService {
    private files: File[] = [];
    private folders: Folder[] = [];

    public uploadFile(file: File): void {
        // Logic to upload a file
        this.files.push(file);
    }

    public organizeFile(fileId: string, folderId: string): void {
        // Logic to organize a file into a folder
        const file = this.files.find(f => f.id === fileId);
        const folder = this.folders.find(f => f.id === folderId);
        if (file && folder) {
            folder.files.push(file);
        }
    }

    public getFilesByFolder(folderId: string): File[] {
        // Logic to get files by folder
        const folder = this.folders.find(f => f.id === folderId);
        return folder ? folder.files : [];
    }

    public searchFiles(query: string): File[] {
        // Logic to search files by title or tags
        return this.files.filter(file => file.title.includes(query) || file.tags.includes(query));
    }

    public deleteFile(fileId: string): void {
        // Logic to delete a file
        this.files = this.files.filter(file => file.id !== fileId);
    }
}