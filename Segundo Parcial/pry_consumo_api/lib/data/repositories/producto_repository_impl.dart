import '../../domain/entities/producto_entity.dart';
import '../datasource/base_datasource.dart';
import '../models/producto_model.dart';
import './base_repository.dart';

class ProductoRepositoryImpl implements BaseRepository {
  final BaseDataSource ds;
  ProductoRepositoryImpl(this.ds);

  @override
  Future<List<ProductoEntity>> getProducts() {
    return ds.fetchProductos();
  }

  @override
  Future<ProductoEntity> createProducts(ProductoEntity product) {
    return ds.createProductos({
      "nombre": product.nombre,
      "precio": product.precio,
      "categoria": product.categoria,
      "stock": product.stock,
    });
  }

  @override
  Future<bool> deleteProducts(String id) {
    return ds.deleteProductos(id);
  }

  @override
  Future<ProductoEntity> updateProducts(String id, ProductoEntity product) {
    return ds.updateProductos( id, {
      "nombre": product.nombre,
      "precio": product.precio,
      "categoria": product.categoria,
      "stock": product.stock,
    });
  }
}