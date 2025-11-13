import 'package:flutter/material.dart';
import '../../controller/cliente_controller.dart';
import '../moleculas/fila_resultado.dart';

class ListaResultadosOrganism extends StatelessWidget {
  final ClienteController controller;

  ListaResultadosOrganism({required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.clientes.isEmpty) {
      return Center(child: Text('No hay clientes registrados aún.'));
    }

    return ListView.builder(
      itemCount: controller.clientes.length,
      itemBuilder: (context, index) {
        final cliente = controller.clientes[index];
        return FilaResultado(cliente: cliente, index: index);
      },
    );
  }
}
