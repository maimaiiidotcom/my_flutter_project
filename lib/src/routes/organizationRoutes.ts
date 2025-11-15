import { Router } from 'express';
import { OrganizationController } from '../controllers/organizationController';

const router = Router();
const organizationController = new OrganizationController();

// Route to create a new folder
router.post('/folders', organizationController.createFolder);

// Route to get all folders
router.get('/folders', organizationController.getAllFolders);

// Route to add tags to a file
router.post('/files/:fileId/tags', organizationController.addTagsToFile);

// Route to get files by folder
router.get('/folders/:folderId/files', organizationController.getFilesByFolder);

export default router;