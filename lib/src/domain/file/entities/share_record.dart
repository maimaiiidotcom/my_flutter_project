class ShareRecord {
  final String id;
  final String materialId;
  final String teacherId;
  final String? classId;  
  final String? groupId;
  final String? shareLink;
  final String? qrCode;
  final DateTime createdAt;

  ShareRecord({
    required this.id,
    required this.materialId,
    required this.teacherId,
    this.classId,
    this.groupId,
    this.shareLink,
    this.qrCode,
    required this.createdAt,
  });
}
