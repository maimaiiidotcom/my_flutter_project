import '../../domain/entities/share_record.dart';

class ShareRecordModel extends ShareRecord {
  ShareRecordModel({
    required super.id,
    required super.materialId,
    required super.teacherId,
    super.classId,
    super.groupId,
    super.shareLink,
    super.qrCode,
    required super.createdAt,
  });

  factory ShareRecordModel.fromMap(Map<String, dynamic> map, String id) {
    return ShareRecordModel(
      id: id,
      materialId: map['materialId'],
      teacherId: map['teacherId'],
      classId: map['classId'],
      groupId: map['groupId'],
      shareLink: map['shareLink'],
      qrCode: map['qrCode'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'materialId': materialId,
      'teacherId': teacherId,
      'classId': classId,
      'groupId': groupId,
      'shareLink': shareLink,
      'qrCode': qrCode,
      'createdAt': createdAt,
    };
  }
}
