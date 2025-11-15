import 'package:dartz/dartz.dart';

import '../../domain/file/entities/material_entity.dart';
import '../../domain/file/repositories/file_upload_repository.dart';
import '../../core/errors/failure.dart';

import '../datasources/file_upload_remote_data_source.dart';

class FileUploadRepositoryImpl implements FileUploadRepository {
  final FileUploadRemoteDataSource remoteDataSource;

  FileUploadRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, MaterialEntity>> uploadMaterial({
    required String teacherId,
    required String filePath,
    required String fileName,
    required String subject,
    required String folder,
    required String topic,
    required List<String> tags,
  }) async {
    try {
      final data = await remoteDataSource.uploadMaterial(
        teacherId: teacherId,
        filePath: filePath,
        fileName: fileName,
        subject: subject,
        folder: folder,
        topic: topic,
        tags: tags,
      );
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MaterialEntity>>> getMaterialsByTeacher({
    required String teacherId,
  }) async {
    try {
      final materials = await remoteDataSource.getMaterialsByTeacher(
        teacherId: teacherId,
      );
      return Right(materials);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
