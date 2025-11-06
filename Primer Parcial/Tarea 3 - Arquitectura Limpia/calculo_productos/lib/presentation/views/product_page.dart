import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/usecases/add_product.dart';
import '../presenters/product_presenter.dart';
import 'product_view_contract.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    implements ProductViewContract {
  late ProductPresenter _presenter;

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();

  List<Product> _products = [];
  double _subtotal = 0, _iva = 0, _total = 0;

  @override
  void initState() {
    super.initState();
    final repo = ProductRepositoryImpl();
    final useCase = AddProductUseCase(repo);
    _presenter = ProductPresenter(this, useCase);
  }

  @override
  void updateProductList(List<Product> products) {
    setState(() => _products = products);
  }

  @override
  void updateTotals(double subtotal, double iva, double totalFinal) {
    setState(() {
      _subtotal = subtotal;
      _iva = iva;
      _total = totalFinal;
    });
  }

  @override
  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _onAddProduct() {
    _presenter.addProduct(
      _nameController.text,
      double.tryParse(_priceController.text) ?? 0,
      int.tryParse(_quantityController.text) ?? 0,
    );
    _nameController.clear();
    _priceController.clear();
    _quantityController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gestor de Ingreso de Productos ")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: "Nombre del producto")),
            TextField(controller: _priceController, decoration: const InputDecoration(labelText: "Precio"), keyboardType: TextInputType.number),
            TextField(controller: _quantityController, decoration: const InputDecoration(labelText: "Cantidad"), keyboardType: TextInputType.number),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: _onAddProduct, child: const Text("Agregar")),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (_, index) {
                  final p = _products[index];
                  return ListTile(
                    title: Text(p.name),
                    subtitle: Text("Precio: \$${p.price.toStringAsFixed(2)} x ${p.quantity} = \$${p.total.toStringAsFixed(2)}"),
                  );
                },
              ),
            ),
            const Divider(),
            Text("Subtotal: \$${_subtotal.toStringAsFixed(2)}"),
            Text("IVA (15%): \$${_iva.toStringAsFixed(2)}"),
            Text("Total: \$${_total.toStringAsFixed(2)}", style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
