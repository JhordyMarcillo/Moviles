import 'package:flutter/foundation.dart';
import '../model/cliente_model.dart';

class ClienteController {
  final List<ClienteModel> clientes = [];
  double totalIntereses = 0.0;
  double totalMultas = 0.0;

  void agregarYCalcular(ClienteModel cliente) {
    cliente.calcularTodo();
    clientes.add(cliente);
    totalIntereses += cliente.interes;
    totalMultas += cliente.multa;
  }

  void limpiar() {
    clientes.clear();
    totalIntereses = 0.0;
    totalMultas = 0.0;
  }

  double get gananciaBanco => totalIntereses + totalMultas;
}
