import '../../domain/entities/product.dart';

abstract class ProductViewContract {
  void updateProductList(List<Product> products);
  void updateTotals(double subtotal, double iva, double totalFinal);
  void showError(String message);
}
