import { Request, Response } from 'express';
import { AuthService } from '../services/authService';

export class AuthController {
    private authService: AuthService;

    constructor() {
        this.authService = new AuthService();
    }

    public async signUp(req: Request, res: Response): Promise<void> {
        try {
            const userData = req.body;
            const newUser = await this.authService.signUp(userData);
            res.status(201).json(newUser);
        } catch (error) {
            res.status(400).json({ message: error.message });
        }
    }

    public async login(req: Request, res: Response): Promise<void> {
        try {
            const { email, password } = req.body;
            const token = await this.authService.login(email, password);
            res.status(200).json({ token });
        } catch (error) {
            res.status(401).json({ message: error.message });
        }
    }

    public async selectRole(req: Request, res: Response): Promise<void> {
        try {
            const { userId, role } = req.body;
            const updatedUser = await this.authService.selectRole(userId, role);
            res.status(200).json(updatedUser);
        } catch (error) {
            res.status(400).json({ message: error.message });
        }
    }
}