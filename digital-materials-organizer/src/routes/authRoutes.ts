import { Router } from 'express';
import { AuthController } from '../controllers/authController';
import { authMiddleware } from '../middlewares/authMiddleware';

const router = Router();
const authController = new AuthController();

// User sign-up route
router.post('/signup', authController.signUp);

// User login route
router.post('/login', authController.login);

// Role selection route (if applicable)
router.post('/role', authMiddleware, authController.selectRole);

export default router;