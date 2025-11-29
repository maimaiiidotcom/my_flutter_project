import '../entities/shared_material_entity.dart';

abstract class SharingRepository {
  Future<void> shareMaterial(SharedMaterialEntity shared);
  Future<List<SharedMaterialEntity>> getSharedMaterials(String groupId);
  Future<String> generateShareLink(String materialId);
  Future<String> generateQrCode(String materialId);
}
