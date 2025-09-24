import { v4 as uuidv4 } from 'uuid';

export interface Folder {
    id: string;
    name: string;
    parentId?: string; // Optional for nested folders
    createdAt: Date;
    updatedAt: Date;
}

export class FolderModel {
    private folders: Folder[] = [];

    constructor() {}

    createFolder(name: string, parentId?: string): Folder {
        const newFolder: Folder = {
            id: uuidv4(),
            name,
            parentId,
            createdAt: new Date(),
            updatedAt: new Date(),
        };
        this.folders.push(newFolder);
        return newFolder;
    }

    getFolders(): Folder[] {
        return this.folders;
    }

    updateFolder(id: string, name: string): Folder | undefined {
        const folder = this.folders.find(folder => folder.id === id);
        if (folder) {
            folder.name = name;
            folder.updatedAt = new Date();
            return folder;
        }
        return undefined;
    }

    deleteFolder(id: string): boolean {
        const index = this.folders.findIndex(folder => folder.id === id);
        if (index !== -1) {
            this.folders.splice(index, 1);
            return true;
        }
        return false;
    }
}