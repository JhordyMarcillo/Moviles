import '../entities/producto_entity.dart';
import '../../data/repositories/base_repository.dart';

class CreateProductoUsecase{
  final BaseRepository repository;

  CreateProductoUsecase(this.repository);

  Future<ProductoEntity> call(ProductoEntity producto){
    return repository.createProducts(producto);
  }
}