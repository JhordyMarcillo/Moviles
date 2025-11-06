import '../../domain/entities/product.dart';
import '../../domain/usecases/add_product.dart';
import '../views/product_view_contract.dart';

class ProductPresenter {
  final ProductViewContract view;
  final AddProductUseCase addProductUseCase;
  final double ivaRate = 0.15;

  ProductPresenter(this.view, this.addProductUseCase);

  Future<void> addProduct(String name, double price, int quantity) async {
    if (name.isEmpty || price <= 0 || quantity <= 0) {
      view.showError("Datos inválidos. Verifica los campos.");
      return;
    }

    final product = Product(name: name, price: price, quantity: quantity);
    final products = await addProductUseCase(product);

    _updateTotals(products);
    view.updateProductList(products);
  }

  void _updateTotals(List<Product> products) {
    final subtotal = products.fold(0.0, (sum, item) => sum + item.total);
    final iva = subtotal * ivaRate;
    final total = subtotal + iva;
    view.updateTotals(subtotal, iva, total);
  }
}
