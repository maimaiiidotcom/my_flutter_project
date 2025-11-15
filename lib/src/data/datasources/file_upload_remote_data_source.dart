import '../models/material_model.dart';

abstract class FileUploadRemoteDataSource {
  Future<MaterialModel> uploadMaterial({
    required String teacherId,
    required String filePath,
    required String fileName,
    required String subject,
    required String folder,
    required String topic,
    required List<String> tags,
  });

  Future<List<MaterialModel>> getMaterialsByTeacher({
    required String teacherId,
  });
}
