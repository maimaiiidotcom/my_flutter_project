import '../entities/share_record.dart';
import 'package:dartz/dartz.dart';
import '../errors/failure.dart';

abstract class ShareRepository {
  Future<Either<Failure, ShareRecord>> shareMaterial(
    String materialId,
    String teacherId,
    {String? classId, String? groupId}
  );

  Future<Either<Failure, List<ShareRecord>>> getSharesByMaterial(String materialId);

  Future<Either<Failure, List<ShareRecord>>> getSharesForClass(String classId);

  Future<Either<Failure, List<ShareRecord>>> getSharesForGroup(String groupId);
}
