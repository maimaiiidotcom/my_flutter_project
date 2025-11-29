import '../../entities/material_entity.dart';
import '../../repositories/material_repository.dart';

class GetMaterialsByFolder {
  final MaterialRepository repo;

  GetMaterialsByFolder(this.repo);

  Future<List<MaterialEntity>> call(String folderId) {
    return repo.getMaterialsByFolder(folderId);
  }
}
