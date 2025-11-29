import '../entities/folder_entity.dart';

abstract class FolderRepository {
  Future<FolderEntity> createFolder(FolderEntity folder);
  Future<void> renameFolder(String folderId, String newName);
  Future<void> deleteFolder(String folderId);
  Future<List<FolderEntity>> getTeacherFolders(String teacherId);
}
