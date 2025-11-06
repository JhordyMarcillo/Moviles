import '../entities/product.dart';
import '../repositories/product_repository.dart';

class AddProductUseCase {
  final ProductRepository repository;

  AddProductUseCase(this.repository);

  Future<List<Product>> call(Product product) async {
    await repository.addProduct(product);
    return repository.getProducts();
  }
}
