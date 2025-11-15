import '../models/material_model.dart';

abstract class StudentFileRemoteDataSource {
  Future<List<MaterialModel>> getMaterialsForStudent({
    required String studentId,
    List<String>? subjects,
  });

  Future<MaterialModel> getMaterialById({
    required String materialId,
  });

  Future<String> getDownloadUrl({
    required String materialId,
  });
}
