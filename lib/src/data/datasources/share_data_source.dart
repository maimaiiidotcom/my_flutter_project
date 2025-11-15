import '../../models/share_record_model.dart';

abstract class ShareDataSource {
  Future<ShareRecordModel> shareMaterial(
    String materialId,
    String teacherId,
    {String? classId, String? groupId}
  );

  Future<List<ShareRecordModel>> getSharesByMaterial(String materialId);

  Future<List<ShareRecordModel>> getSharesForClass(String classId);

  Future<List<ShareRecordModel>> getSharesForGroup(String groupId);
}



