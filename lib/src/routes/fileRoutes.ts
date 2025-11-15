import { Router } from 'express';
import { FileController } from '../controllers/fileController';

const router = Router();
const fileController = new FileController();

// Route for uploading files
router.post('/upload', fileController.uploadFile);

// Route for accessing files
router.get('/files/:id', fileController.getFile);

// Route for downloading files
router.get('/download/:id', fileController.downloadFile);

// Route for listing files by subject or topic
router.get('/list', fileController.listFiles);

export default router;