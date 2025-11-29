import '../../entities/user_entity.dart';
import '../../repositories/user_repository.dart';

class SignUpUser {
  final UserRepository repo;

  SignUpUser(this.repo);

  Future<UserEntity> call(UserEntity user) {
    return repo.signUp(user);
  }
}
