import 'package:dartz/dartz.dart';
import '../../domain/file/entities/material_entity.dart';
import '../../domain/file/repositories/file_access_repository.dart';
import '../../core/errors/failure.dart';

import '../datasources/student_file_remote_data_source.dart';

class StudentFileRepositoryImpl implements FileAccessRepository {
  final StudentFileRemoteDataSource remoteDataSource;

  StudentFileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<MaterialEntity>>> getMaterialsForStudent({
    required String studentId,
    List<String>? subjects,
  }) async {
    try {
      final materials = await remoteDataSource.getMaterialsForStudent(
        studentId: studentId,
        subjects: subjects,
      );
      return Right(materials);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MaterialEntity>> getMaterialById({
    required String materialId,
  }) async {
    try {
      final material = await remoteDataSource.getMaterialById(
        materialId: materialId,
      );
      return Right(material);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getDownloadUrl({
    required String materialId,
  }) async {
    try {
      final url = await remoteDataSource.getDownloadUrl(materialId: materialId);
      return Right(url);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
