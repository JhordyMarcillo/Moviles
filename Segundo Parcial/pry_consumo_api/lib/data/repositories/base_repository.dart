import '../../domain/entities/producto_entity.dart';

abstract class BaseRepository {
  Future<List<ProductoEntity>> getProducts();
  Future<ProductoEntity> createProducts(ProductoEntity product);
  Future<ProductoEntity> updateProducts(String id, ProductoEntity product);
  Future<bool> deleteProducts(String id);

}