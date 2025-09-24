import { Request, Response } from 'express';
import { OrganizationService } from '../services/organizationService';

export class OrganizationController {
    private organizationService: OrganizationService;

    constructor() {
        this.organizationService = new OrganizationService();
    }

    public createFolder = async (req: Request, res: Response): Promise<void> => {
        try {
            const { name, parentFolderId } = req.body;
            const newFolder = await this.organizationService.createFolder(name, parentFolderId);
            res.status(201).json(newFolder);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    };

    public getFolders = async (req: Request, res: Response): Promise<void> => {
        try {
            const folders = await this.organizationService.getFolders();
            res.status(200).json(folders);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    };

    public tagFile = async (req: Request, res: Response): Promise<void> => {
        try {
            const { fileId, tags } = req.body;
            const updatedFile = await this.organizationService.tagFile(fileId, tags);
            res.status(200).json(updatedFile);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    };

    public getTags = async (req: Request, res: Response): Promise<void> => {
        try {
            const tags = await this.organizationService.getTags();
            res.status(200).json(tags);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    };
}