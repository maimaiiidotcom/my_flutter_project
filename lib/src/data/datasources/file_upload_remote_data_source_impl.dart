import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/material_model.dart';
import 'file_upload_remote_data_source.dart';

class FileUploadRemoteDataSourceImpl implements FileUploadRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  FileUploadRemoteDataSourceImpl({
    required this.firestore,
    required this.storage,
  });

  @override
  Future<MaterialModel> uploadMaterial({
    required String teacherId,
    required String filePath,
    required String fileName,
    required String subject,
    required String folder,
    required String topic,
    required List<String> tags,
  }) async {
    // Upload file to Firebase Storage
    final file = File(filePath);
    final storageRef = storage.ref().child('materials/$teacherId/$fileName');

    await storageRef.putFile(file);

    final fileUrl = await storageRef.getDownloadURL();

    // Save metadata in Firestore
    final docRef = firestore.collection('materials').doc();

    final data = MaterialModel(
      id: docRef.id,
      teacherId: teacherId,
      fileName: fileName,
      fileUrl: fileUrl,
      subject: subject,
      folder: folder,
      topic: topic,
      tags: tags,
      uploadedAt: DateTime.now(),
    );

    await docRef.set(data.toMap());

    return data;
  }

  @override
  Future<List<MaterialModel>> getMaterialsByTeacher({
    required String teacherId,
  }) async {
    final snap = await firestore
        .collection('materials')
        .where('teacherId', isEqualTo: teacherId)
        .orderBy('uploadedAt', descending: true)
        .get();

    return snap.docs
        .map((doc) => MaterialModel.fromMap(doc.data()))
        .toList();
  }
}
