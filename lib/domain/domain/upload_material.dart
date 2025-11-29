import '../../entities/material_entity.dart';
import '../../repositories/material_repository.dart';

class UploadMaterial {
  final MaterialRepository repo;

  UploadMaterial(this.repo);

  Future<MaterialEntity> call(MaterialEntity material) {
    return repo.uploadMaterial(material);
  }
}
