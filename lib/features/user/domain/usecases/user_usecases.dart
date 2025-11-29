import 'package:firebase_auth/firebase_auth.dart' as fb;
import '../../data/repositories/user_repository_impl.dart';

class SignInUseCase {
  final UserRepository repo;
  SignInUseCase(this.repo);
  Future<fb.User?> call(String email, String password) => repo.signIn(email, password);
}

class SignOutUseCase {
  final UserRepository repo;
  SignOutUseCase(this.repo);
  Future<void> call() => repo.signOut();
}

class CreateUserUseCase {
  final UserRepository repo;
  CreateUserUseCase(this.repo);
  Future<fb.User?> call(String email, String password, Map<String, dynamic> profile) => repo.createUser(email, password, profile);
}

class GetProfileUseCase {
  final UserRepository repo;
  GetProfileUseCase(this.repo);
  Future<Map<String, dynamic>?> call(String uid) => repo.getProfile(uid);
}

class UpdateProfileUseCase {
  final UserRepository repo;
  UpdateProfileUseCase(this.repo);
  Future<void> call(String uid, Map<String, dynamic> data) => repo.updateProfile(uid, data);
}

class GetCurrentUserUseCase {
  final UserRepository repo;
  GetCurrentUserUseCase(this.repo);
  Future<fb.User?> call() => repo.getCurrentUser();
}
