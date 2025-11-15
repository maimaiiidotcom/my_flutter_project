import { Folder } from '../models/folder';
import { File } from '../models/file';

export class OrganizationService {
    private folders: Folder[] = [];
    private files: File[] = [];

    constructor() {
        // Initialize with default folders if necessary
    }

    createFolder(name: string, parentId?: string): Folder {
        const newFolder = new Folder(name, parentId);
        this.folders.push(newFolder);
        return newFolder;
    }

    getFolders(): Folder[] {
        return this.folders;
    }

    getFolderById(id: string): Folder | undefined {
        return this.folders.find(folder => folder.id === id);
    }

    addFileToFolder(fileId: string, folderId: string): boolean {
        const folder = this.getFolderById(folderId);
        const file = this.files.find(file => file.id === fileId);
        
        if (folder && file) {
            folder.addFile(file);
            return true;
        }
        return false;
    }

    tagFile(fileId: string, tags: string[]): boolean {
        const file = this.files.find(file => file.id === fileId);
        
        if (file) {
            file.tags = [...new Set([...file.tags, ...tags])]; // Avoid duplicate tags
            return true;
        }
        return false;
    }

    searchFilesByTag(tag: string): File[] {
        return this.files.filter(file => file.tags.includes(tag));
    }

    // Additional methods for managing organization can be added here
}