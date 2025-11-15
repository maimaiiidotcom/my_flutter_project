import '../../../domain/file/entities/folder_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FolderModel extends FolderEntity {
  FolderModel({
    required super.id,
    required super.teacherId,
    required super.name,
    super.parentId,
    required super.tags,
    required super.createdAt,
  });

  factory FolderModel.fromMap(Map<String, dynamic> map) {
    return FolderModel(
      id: map['id'],
      teacherId: map['teacherId'],
      name: map['name'],
      parentId: map['parentId'],
      tags: List<String>.from(map['tags'] ?? []),
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'teacherId': teacherId,
      'name': name,
      'parentId': parentId,
      'tags': tags,
      'createdAt': createdAt,
    };
  }
}
