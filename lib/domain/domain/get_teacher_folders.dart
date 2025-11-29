import '../../entities/folder_entity.dart';
import '../../repositories/folder_repository.dart';

class GetTeacherFolders {
  final FolderRepository repo;

  GetTeacherFolders(this.repo);

  Future<List<FolderEntity>> call(String teacherId) {
    return repo.getTeacherFolders(teacherId);
  }
}
