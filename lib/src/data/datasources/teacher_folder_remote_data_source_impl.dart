import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/folder_model.dart';
import 'teacher_folder_remote_data_source.dart';

class TeacherFolderRemoteDataSourceImpl implements TeacherFolderRemoteDataSource {
  final FirebaseFirestore firestore;

  TeacherFolderRemoteDataSourceImpl({required this.firestore});

  @override
  Future<FolderModel> createFolder(FolderModel folder) async {
    final docRef = firestore.collection('folders').doc(folder.id);
    await docRef.set(folder.toMap());
    return folder;
  }

  @override
  Future<FolderModel> updateFolder(FolderModel folder) async {
    final docRef = firestore.collection('folders').doc(folder.id);
    await docRef.update(folder.toMap());
    return folder;
  }

  @override
  Future<void> deleteFolder(String folderId) async {
    await firestore.collection('folders').doc(folderId).delete();
  }

  @override
  Future<List<FolderModel>> getFoldersByTeacher(String teacherId) async {
    final snapshot = await firestore
        .collection('folders')
        .where('teacherId', isEqualTo: teacherId)
        .get();

    return snapshot.docs.map((doc) => FolderModel.fromMap(doc.data())).toList();
  }

  @override
  Future<List<FolderModel>> getSubfolders(String parentId) async {
    final snapshot = await firestore
        .collection('folders')
        .where('parentId', isEqualTo: parentId)
        .get();

    return snapshot.docs.map((doc) => FolderModel.fromMap(doc.data())).toList();
  }
}
