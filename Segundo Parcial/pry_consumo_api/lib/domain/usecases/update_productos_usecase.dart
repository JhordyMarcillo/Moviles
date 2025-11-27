import '../entities/producto_entity.dart';
import '../../data/repositories/base_repository.dart';

class UpdateProductosUsecase{
  final BaseRepository repository;

  UpdateProductosUsecase(this.repository);

  Future<ProductoEntity> call(String id, ProductoEntity producto){
    return repository.updateProducts(id, producto);
  }
}