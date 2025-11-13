import 'package:flutter/material.dart';
import '../../controller/cliente_controller.dart';
import '../../view/widgets_comunes/appbar_general.dart';
import '../../utils/helpers.dart';

class ResultadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    final ClienteController controller = args as ClienteController;

    return Scaffold(
      appBar: appBarGeneral('Resultados'),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Resumen', style: Theme.of(context).textTheme.displayLarge),
            SizedBox(height: 12),
            Text('Clientes procesados: ${controller.clientes.length}'),
            SizedBox(height: 8),
            Text('Total intereses generados: ${formatoMoneda(controller.totalIntereses)}'),
            Text('Total multas: ${formatoMoneda(controller.totalMultas)}'),
            SizedBox(height: 8),
            Text('Ganancia total banco: ${formatoMoneda(controller.gananciaBanco)}'),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: controller.clientes.length,
                itemBuilder: (context, index) {
                  final c = controller.clientes[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      title: Text('Cliente ${index + 1}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Saldo actual: ${formatoMoneda(c.saldoActual)}'),
                          Text('Pago mínimo: ${formatoMoneda(c.pagoMinimo)}'),
                          Text('Pago sin intereses: ${formatoMoneda(c.pagoTotal)}'),
                          Text('Interés: ${formatoMoneda(c.interes)}'),
                          Text('Multa: ${formatoMoneda(c.multa)}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
