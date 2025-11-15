import '../models/folder_model.dart';

abstract class TeacherFolderRemoteDataSource {
  Future<FolderModel> createFolder(FolderModel folder);
  Future<FolderModel> updateFolder(FolderModel folder);
  Future<void> deleteFolder(String folderId);
  Future<List<FolderModel>> getFoldersByTeacher(String teacherId);
  Future<List<FolderModel>> getSubfolders(String parentId);
}
