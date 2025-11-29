import '../../repositories/folder_repository.dart';

class DeleteFolder {
  final FolderRepository repo;

  DeleteFolder(this.repo);

  Future<void> call(String folderId) {
    return repo.deleteFolder(folderId);
  }
}
