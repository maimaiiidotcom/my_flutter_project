import '../../entities/material_entity.dart';
import '../../repositories/student_material_repository.dart';

class DownloadMaterial {
  final StudentMaterialRepository repo;

  DownloadMaterial(this.repo);

  Future<MaterialEntity> call(String materialId) {
    return repo.downloadMaterial(materialId);
  }
}
