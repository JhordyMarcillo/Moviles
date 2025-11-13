import 'package:flutter/material.dart';
import '../../controller/cliente_controller.dart';
import '../../model/cliente_model.dart';
import '../moleculas/formulario_cliente.dart';

class ClienteFormOrganism extends StatefulWidget {
  final ClienteController controller;

  const ClienteFormOrganism({required this.controller});

  @override
  _ClienteFormOrganismState createState() => _ClienteFormOrganismState();
}

class _ClienteFormOrganismState extends State<ClienteFormOrganism> {
  void _onSubmit(double saldoAnterior, double compras, double pagoAnterior) {
    final cliente = ClienteModel(
      saldoAnterior: saldoAnterior,
      compras: compras,
      pagoAnterior: pagoAnterior,
    );
    widget.controller.agregarYCalcular(cliente);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cliente registrado correctamente')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormularioCliente(onSubmit: _onSubmit);
  }
}
