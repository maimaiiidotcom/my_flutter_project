import '../../entities/user_entity.dart';
import '../../repositories/user_repository.dart';

class GetUserProfile {
  final UserRepository repo;

  GetUserProfile(this.repo);

  Future<UserEntity> call(String userId) {
    return repo.getUserProfile(userId);
  }
}
