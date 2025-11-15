import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/share_record_model.dart';
import 'share_data_source.dart';

class ShareDataSourceImpl implements ShareDataSource {
  final FirebaseFirestore firestore;

  ShareDataSourceImpl(this.firestore);

  @override
  Future<ShareRecordModel> shareMaterial(
    String materialId,
    String teacherId,
    {String? classId, String? groupId}
  ) async {
    final doc = await firestore.collection('shares').add({
      'materialId': materialId,
      'teacherId': teacherId,
      'classId': classId,
      'groupId': groupId,
      'shareLink': null,
      'qrCode': null,
      'createdAt': DateTime.now(),
    });

    final snapshot = await doc.get();
    return ShareRecordModel.fromMap(snapshot.data()!, snapshot.id);
  }

  @override
  Future<List<ShareRecordModel>> getSharesByMaterial(String materialId) async {
    final query = await firestore
        .collection('shares')
        .where('materialId', isEqualTo: materialId)
        .get();

    return query.docs
        .map((e) => ShareRecordModel.fromMap(e.data(), e.id))
        .toList();
  }

  @override
  Future<List<ShareRecordModel>> getSharesForClass(String classId) async {
    final query = await firestore
        .collection('shares')
        .where('classId', isEqualTo: classId)
        .get();

    return query.docs
        .map((e) => ShareRecordModel.fromMap(e.data(), e.id))
        .toList();
  }

  @override
  Future<List<ShareRecordModel>> getSharesForGroup(String groupId) async {
    final query = await firestore
        .collection('shares')
        .where('groupId', isEqualTo: groupId)
        .get();

    return query.docs
        .map((e) => ShareRecordModel.fromMap(e.data(), e.id))
        .toList();
  }
}
