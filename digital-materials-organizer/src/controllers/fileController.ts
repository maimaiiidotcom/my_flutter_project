import { Request, Response } from 'express';
import { FileService } from '../services/fileService';

export class FileController {
    private fileService: FileService;

    constructor() {
        this.fileService = new FileService();
    }

    public uploadFile = async (req: Request, res: Response): Promise<void> => {
        try {
            const fileData = req.body; // Assuming file data is sent in the request body
            const result = await this.fileService.uploadFile(fileData);
            res.status(201).json({ message: 'File uploaded successfully', data: result });
        } catch (error) {
            res.status(500).json({ message: 'Error uploading file', error: error.message });
        }
    };

    public getFiles = async (req: Request, res: Response): Promise<void> => {
        try {
            const subject = req.params.subject; // Assuming subject is passed as a URL parameter
            const files = await this.fileService.getFilesBySubject(subject);
            res.status(200).json(files);
        } catch (error) {
            res.status(500).json({ message: 'Error retrieving files', error: error.message });
        }
    };

    public downloadFile = async (req: Request, res: Response): Promise<void> => {
        try {
            const fileId = req.params.id; // Assuming file ID is passed as a URL parameter
            const file = await this.fileService.downloadFile(fileId);
            res.download(file.path, file.name); // Assuming file object contains path and name
        } catch (error) {
            res.status(500).json({ message: 'Error downloading file', error: error.message });
        }
    };

    public organizeFiles = async (req: Request, res: Response): Promise<void> => {
        try {
            const organizationData = req.body; // Assuming organization data is sent in the request body
            const result = await this.fileService.organizeFiles(organizationData);
            res.status(200).json({ message: 'Files organized successfully', data: result });
        } catch (error) {
            res.status(500).json({ message: 'Error organizing files', error: error.message });
        }
    };
}