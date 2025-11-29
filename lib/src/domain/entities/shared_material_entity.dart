class SharedMaterialEntity {
  final String id;
  final String materialId;
  final String sharedToGroupId;
  final String sharedBy;
  final DateTime sharedAt;

  SharedMaterialEntity({
    required this.id,
    required this.materialId,
    required this.sharedToGroupId,
    required this.sharedBy,
    required this.sharedAt,
  });
}
