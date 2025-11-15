import 'package:dartz/dartz.dart';
import '../../domain/file/entities/folder_entity.dart';
import '../../domain/file/repositories/folder_repository.dart';
import '../../core/errors/failure.dart';
import '../datasources/teacher_folder_remote_data_source.dart';

class TeacherFolderRepositoryImpl implements FolderRepository {
  final TeacherFolderRemoteDataSource remoteDataSource;

  TeacherFolderRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, FolderEntity>> createFolder(FolderEntity folder) async {
    try {
      final created = await remoteDataSource.createFolder(folder as dynamic);
      return Right(created);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FolderEntity>> updateFolder(FolderEntity folder) async {
    try {
      final updated = await remoteDataSource.updateFolder(folder as dynamic);
      return Right(updated);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteFolder(String folderId) async {
    try {
      await remoteDataSource.deleteFolder(folderId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<FolderEntity>>> getFoldersByTeacher(String teacherId) async {
    try {
      final folders = await remoteDataSource.getFoldersByTeacher(teacherId);
      return Right(folders);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<FolderEntity>>> getSubfolders(String parentId) async {
    try {
      final subfolders = await remoteDataSource.getSubfolders(parentId);
      return Right(subfolders);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
