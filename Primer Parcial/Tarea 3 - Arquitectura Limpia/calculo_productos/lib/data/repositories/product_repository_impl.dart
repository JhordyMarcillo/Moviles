import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final List<Product> _storage = [];

  @override
  Future<void> addProduct(Product product) async {
    _storage.add(product);
  }

  @override
  Future<List<Product>> getProducts() async {
    return List.unmodifiable(_storage);
  }
}
