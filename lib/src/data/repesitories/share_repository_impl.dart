import 'package:dartz/dartz.dart';
import '../../domain/errors/failure.dart';
import '../../domain/entities/share_record.dart';
import '../../domain/repositories/share_repository.dart';
import '../datasources/share_data_source.dart';
import '../models/share_record_model.dart';

class ShareRepositoryImpl implements ShareRepository {
  final ShareDataSource dataSource;

  ShareRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, ShareRecord>> shareMaterial(
    String materialId,
    String teacherId,
    {String? classId, String? groupId}
  ) async {
    try {
      final ShareRecordModel record = await dataSource.shareMaterial(
        materialId,
        teacherId,
        classId: classId,
        groupId: groupId,
      );
      return Right(record);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ShareRecord>>> getSharesByMaterial(
      String materialId) async {
    try {
      final records = await dataSource.getSharesByMaterial(materialId);
      return Right(records);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ShareRecord>>> getSharesForClass(
      String classId) async {
    try {
      final records = await dataSource.getSharesForClass(classId);
      return Right(records);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ShareRecord>>> getSharesForGroup(
      String groupId) async {
    try {
      final records = await dataSource.getSharesForGroup(groupId);
      return Right(records);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
