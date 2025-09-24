import { Request, Response, NextFunction } from 'express';

export const roleMiddleware = (roles: string[]) => {
    return (req: Request, res: Response, next: NextFunction) => {
        const userRole = req.user?.role; // Assuming user role is attached to the request object

        if (!userRole) {
            return res.status(403).json({ message: 'Access denied. No role provided.' });
        }

        if (!roles.includes(userRole)) {
            return res.status(403).json({ message: 'Access denied. Insufficient permissions.' });
        }

        next();
    };
};