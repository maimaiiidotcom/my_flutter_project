import '../../entities/material_entity.dart';
import '../../repositories/student_material_repository.dart';

class GetAccessibleMaterials {
  final StudentMaterialRepository repo;

  GetAccessibleMaterials(this.repo);

  Future<List<MaterialEntity>> call(String studentId) {
    return repo.getAccessibleMaterials(studentId);
  }
}
