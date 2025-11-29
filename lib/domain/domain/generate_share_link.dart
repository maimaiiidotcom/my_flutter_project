import '../../repositories/sharing_repository.dart';

class GenerateShareLink {
  final SharingRepository repo;

  GenerateShareLink(this.repo);

  Future<String> call(String materialId) {
    return repo.generateShareLink(materialId);
  }
}
