import 'package:pry_consumo_api/domain/usecases/create_producto_usecase.dart';

import '../../domain/entities/producto_entity.dart';
import '../../domain/usecases/delete_productos__usecase.dart';
import '../../domain/usecases/get_productos_usecase.dart';
import '../../domain/usecases/update_productos_usecase.dart';
import 'base_viewmodel.dart';

class ProductoViewModel extends BaseViewModel {
  final GetProductosUseCase usecase;
  final CreateProductoUsecase createProductoUsecase;
  final UpdateProductosUsecase updateProductosUsecase;
  final DeleteProductosUsecase deleteProductosUsecase;


  List<ProductoEntity> productos = [];

  ProductoViewModel({required this.usecase, required this.createProductoUsecase, required this.updateProductosUsecase, required this.deleteProductosUsecase});

  Future<void> cargarProductos() async {
    setLoading(true);
    productos = await usecase();
    setLoading(false);
  }

  Future<void> agregarProductos(ProductoEntity producto) async {
    await createProductoUsecase(producto);
    await cargarProductos();
  }

  Future<void> editarProductos(String id, ProductoEntity producto) async {
    await updateProductosUsecase(id, producto);
    await cargarProductos();
  }

  Future<void> eliminarProductos(String id) async {
    await deleteProductosUsecase(id);
    await cargarProductos();
  }

}
