import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/presentation/viewmodels/producto_viewmodel.dart';
import '/domain/usecases/get_productos_usecase.dart';
import '/domain/usecases/delete_productos__usecase.dart';
import '/domain/usecases/update_productos_usecase.dart';
import '/domain/usecases/create_producto_usecase.dart';
import '/data/repositories/producto_repository_impl.dart';
import './data/datasource/producto_api_datasource.dart';
import '/presentation/routes/app_routes.dart';

void main() {
  // Inyección de dependencias
  final dataSource = ProductoApiDataSource();
  final repo = ProductoRepositoryImpl(dataSource);
  final getProductosUseCase = GetProductosUseCase(repo);
  final createProductoUseCase = CreateProductoUsecase(repo);
  final updateProductosUseCase = UpdateProductosUsecase(repo);
  final deleteProductosUseCase = DeleteProductosUsecase(repo);

  runApp(
    MyApp(
      getUseCase: getProductosUseCase,
      createUseCase: createProductoUseCase,
      updateUseCase: updateProductosUseCase,
      deleteUseCase: deleteProductosUseCase,
    ),
  );
}

class MyApp extends StatelessWidget {
  final GetProductosUseCase getUseCase;
  final CreateProductoUsecase createUseCase;
  final UpdateProductosUsecase updateUseCase;
  final DeleteProductosUsecase deleteUseCase;

  const MyApp({
    super.key,
    required this.getUseCase,
    required this.createUseCase,
    required this.updateUseCase,
    required this.deleteUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductoViewModel(
            usecase: getUseCase,
            createProductoUsecase: createUseCase,
            updateProductosUsecase: updateUseCase,
            deleteProductosUsecase: deleteUseCase,
          )..cargarProductos(),
        ),
      ],
      child: MaterialApp(
        title: "Consumo API Flutter",
        routes: AppRoutes.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
