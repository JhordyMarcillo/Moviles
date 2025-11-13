import 'package:flutter/material.dart';
import '../../controller/cliente_controller.dart';
import '../../view/organismos/cliente_form_organism.dart';
import '../../view/widgets_comunes/appbar_general.dart';
import '../../routes/route_names.dart';
import '../../model/cliente_model.dart';
import '../../view/organismos/lista_resultados_organism.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ClienteController _controller = ClienteController();

  void _navegarResultados() {
    Navigator.pushNamed(context, RouteNames.resultado, arguments: _controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarGeneral('Banco Bandido de Peluche'),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ClienteFormOrganism(controller: _controller),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _controller.clientes.isEmpty ? null : _navegarResultados,
                  child: Text('Ver resultados'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() => _controller.limpiar());
                  },
                  child: Text('Limpiar'),
                ),
              ],
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListaResultadosOrganism(controller: _controller),
            ),
          ],
        ),
      ),
    );
  }
}
