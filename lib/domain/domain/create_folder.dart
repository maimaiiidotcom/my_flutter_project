import '../../entities/folder_entity.dart';
import '../../repositories/folder_repository.dart';

class CreateFolder {
  final FolderRepository repo;

  CreateFolder(this.repo);

  Future<FolderEntity> call(FolderEntity folder) {
    return repo.createFolder(folder);
  }
}
