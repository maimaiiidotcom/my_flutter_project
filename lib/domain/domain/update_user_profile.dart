import '../../entities/user_entity.dart';
import '../../repositories/user_repository.dart';

class UpdateUserProfile {
  final UserRepository repo;

  UpdateUserProfile(this.repo);

  Future<void> call(UserEntity user) {
    return repo.updateUserProfile(user);
  }
}
