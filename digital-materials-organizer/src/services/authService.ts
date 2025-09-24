import { User } from '../models/user';
import { sign, verify } from 'jsonwebtoken';

class AuthService {
    private secretKey: string;

    constructor() {
        this.secretKey = process.env.JWT_SECRET || 'defaultSecret';
    }

    async signUp(email: string, password: string, role: string): Promise<User> {
        const newUser = new User({ email, password, role });
        await newUser.save();
        return newUser;
    }

    async login(email: string, password: string): Promise<string | null> {
        const user = await User.findOne({ email });
        if (user && user.comparePassword(password)) {
            return this.generateToken(user);
        }
        return null;
    }

    private generateToken(user: User): string {
        const payload = { id: user._id, role: user.role };
        return sign(payload, this.secretKey, { expiresIn: '1h' });
    }

    async verifyToken(token: string): Promise<any> {
        try {
            return verify(token, this.secretKey);
        } catch (error) {
            return null;
        }
    }
}

export default new AuthService();