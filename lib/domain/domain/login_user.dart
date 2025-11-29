import '../../entities/user_entity.dart';
import '../../repositories/user_repository.dart';

class LoginUser {
  final UserRepository repo;

  LoginUser(this.repo);

  Future<UserEntity> call(String email, String password) {
    return repo.login(email, password);
  }
}
