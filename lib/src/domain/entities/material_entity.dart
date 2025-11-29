class MaterialEntity {
  final String id;
  final String title;
  final String fileUrl;
  final String subject;
  final String folderId;
  final List<String> tags;
  final int fileSize;
  final String uploadedBy;

  MaterialEntity({
    required this.id,
    required this.title,
    required this.fileUrl,
    required this.subject,
    required this.folderId,
    required this.tags,
    required this.fileSize,
    required this.uploadedBy,
  });
}
