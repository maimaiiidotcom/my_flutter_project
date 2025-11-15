import '../../../domain/file/entities/material_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MaterialModel extends MaterialEntity {
  MaterialModel({
    required super.id,
    required super.teacherId,
    required super.fileName,
    required super.fileUrl,
    required super.subject,
    required super.folder,
    required super.topic,
    required super.tags,
    required super.uploadedAt,
  });

  factory MaterialModel.fromMap(Map<String, dynamic> map) {
    return MaterialModel(
      id: map['id'],
      teacherId: map['teacherId'],
      fileName: map['fileName'],
      fileUrl: map['fileUrl'],
      subject: map['subject'],
      folder: map['folder'],
      topic: map['topic'],
      tags: List<String>.from(map['tags']),
      uploadedAt: (map['uploadedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'teacherId': teacherId,
      'fileName': fileName,
      'fileUrl': fileUrl,
      'subject': subject,
      'folder': folder,
      'topic': topic,
      'tags': tags,
      'uploadedAt': uploadedAt,
    };
  }
}
