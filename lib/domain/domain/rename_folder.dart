import '../../repositories/folder_repository.dart';

class RenameFolder {
  final FolderRepository repo;

  RenameFolder(this.repo);

  Future<void> call(String folderId, String newName) {
    return repo.renameFolder(folderId, newName);
  }
}
