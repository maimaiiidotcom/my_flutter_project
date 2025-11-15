import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> signUpWithEmail({
    required String email,
    required String password,
    required String name,
    required String role,
    required String school,
  });

  Future<UserModel> loginWithEmail({
    required String email,
    required String password,
  });

  Future<UserModel> signInWithGoogle();

  Future<UserModel> getCurrentUserProfile();

  Future<void> logout();
}
