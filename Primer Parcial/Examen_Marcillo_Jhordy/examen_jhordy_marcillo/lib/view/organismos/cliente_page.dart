import 'package:flutter/material.dart';
import '../../controller/cliente_controller.dart';
import '../organismos/cliente_form_organism.dart';
import '../organismos/lista_resultados_organism.dart';

class ClientePage extends StatefulWidget {
  const ClientePage({super.key});

  @override
  State<ClientePage> createState() => _ClientePageState();
}

class _ClientePageState extends State<ClientePage> {
  final ClienteController controller = ClienteController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Banco Bandido de Peluche')),
      body: Column(
        children: [
          // 🧾 Formulario para ingresar datos
          ClienteFormOrganism(controller: controller),

          const SizedBox(height: 16),

          // 📋 Lista de resultados
          Expanded(
            child: ListaResultadosOrganism(controller: controller),
          ),
        ],
      ),
    );
  }
}
