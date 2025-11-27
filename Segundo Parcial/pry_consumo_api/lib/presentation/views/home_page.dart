import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/producto_viewmodel.dart';
import '../../domain/entities/producto_entity.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProductoViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text("Productos")),
      body: vm.loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: vm.productos.length,
        itemBuilder: (_, i) {
          final p = vm.productos[i];

          return ListTile(
            title: Text(p.nombre),
            subtitle: Text("Precio: \$${p.precio}"),

            // editar al tocar
            onTap: () => _mostrarDialogo(context, vm, producto: p),

            // botón eliminar
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () async {
                await vm.eliminarProductos(p.id);
              },
            ),
          );
        },
      ),

      // FAB agregar
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mostrarDialogo(context, vm),
        child: const Icon(Icons.add),
      ),
    );
  }

  // ------------------------------
  // Diálogo para agregar / editar
  // ------------------------------
  void _mostrarDialogo(
      BuildContext context,
      ProductoViewModel vm, {
        ProductoEntity? producto,
      }) {
    final esEditar = producto != null;

    final nombreCtrl  = TextEditingController(text: producto?.nombre ?? "");
    final precioCtrl  = TextEditingController(text: producto?.precio.toString() ?? "");
    final stockCtrl   = TextEditingController(text: producto?.stock.toString() ?? "");
    final categoriaCtrl = TextEditingController(text: producto?.categoria ?? "");

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(esEditar ? "Editar producto" : "Nuevo producto"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nombreCtrl,
              decoration: const InputDecoration(labelText: "Nombre"),
            ),
            TextField(
              controller: precioCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Precio"),
            ),
            TextField(
              controller: stockCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Stock"),
            ),
            TextField(
              controller: categoriaCtrl,
              decoration: const InputDecoration(labelText: "Categoría"),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text("Cancelar"),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text(esEditar ? "Guardar" : "Agregar"),
            onPressed: () async {
              final nombre = nombreCtrl.text.trim();
              final categoria = categoriaCtrl.text.trim();

              final precio = int.tryParse(precioCtrl.text) ?? 0;
              final stock = int.tryParse(stockCtrl.text) ?? 0;

              if (nombre.isEmpty || categoria.isEmpty || precio <= 0 || stock < 0) {
                return;
              }

              final nuevo = ProductoEntity(
                id: producto?.id ?? "",      // Para crear: vacío
                nombre: nombre,
                precio: precio,
                stock: stock,
                categoria: categoria,
              );

              if (esEditar) {
                await vm.editarProductos(producto!.id, nuevo);
              } else {
                await vm.agregarProductos(nuevo);
              }

              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

}