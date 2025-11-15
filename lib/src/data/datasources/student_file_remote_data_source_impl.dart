import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/material_model.dart';
import 'student_file_remote_data_source.dart';

class StudentFileRemoteDataSourceImpl implements StudentFileRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  StudentFileRemoteDataSourceImpl({
    required this.firestore,
    required this.storage,
  });

  @override
  Future<List<MaterialModel>> getMaterialsForStudent({
    required String studentId,
    List<String>? subjects,
  }) async {
    Query query = firestore.collection('materials');

    if (subjects != null && subjects.isNotEmpty) {
      query = query.where('subject', whereIn: subjects);
    }

    final snapshot = await query.orderBy('uploadedAt', descending: true).get();

    return snapshot.docs.map((doc) => MaterialModel.fromMap(doc.data())).toList();
  }

  @override
  Future<MaterialModel> getMaterialById({required String materialId}) async {
    final doc = await firestore.collection('materials').doc(materialId).get();
    if (!doc.exists) throw Exception("Material not found");
    return MaterialModel.fromMap(doc.data()!);
  }

  @override
  Future<String> getDownloadUrl({required String materialId}) async {
    final doc = await firestore.collection('materials').doc(materialId).get();
    if (!doc.exists) throw Exception("Material not found");

    final fileUrl = doc.data()!['fileUrl'] as String;
    return fileUrl;
  }
}
