import '../../entities/shared_material_entity.dart';
import '../../repositories/sharing_repository.dart';

class ShareMaterial {
  final SharingRepository repo;

  ShareMaterial(this.repo);

  Future<void> call(SharedMaterialEntity shared) {
    return repo.shareMaterial(shared);
  }
}
