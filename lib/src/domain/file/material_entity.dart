class MaterialEntity {
  final String id;
  final String teacherId;
  final String fileName;
  final String fileUrl;
  final String subject;
  final String folder;
  final String topic;
  final List<String> tags;
  final DateTime uploadedAt;

  MaterialEntity({
    required this.id,
    required this.teacherId,
    required this.fileName,
    required this.fileUrl,
    required this.subject,
    required this.folder,
    required this.topic,
    required this.tags,
    required this.uploadedAt,
  });
}
