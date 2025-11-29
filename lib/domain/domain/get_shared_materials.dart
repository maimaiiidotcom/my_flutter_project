import '../../entities/shared_material_entity.dart';
import '../../repositories/sharing_repository.dart';

class GetSharedMaterials {
  final SharingRepository repo;

  GetSharedMaterials(this.repo);

  Future<List<SharedMaterialEntity>> call(String groupId) {
    return repo.getSharedMaterials(groupId);
  }
}
