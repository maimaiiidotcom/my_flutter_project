class FolderEntity {
  final String id;
  final String teacherId;
  final String name;
  final String? parentId; // null if root
  final List<String> tags;
  final DateTime createdAt;

  FolderEntity({
    required this.id,
    required this.teacherId,
    required this.name,
    this.parentId,
    required this.tags,
    required this.createdAt,
  });
}
