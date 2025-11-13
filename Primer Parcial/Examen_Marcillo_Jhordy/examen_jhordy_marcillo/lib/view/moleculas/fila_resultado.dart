import 'package:flutter/material.dart';
import '../../model/cliente_model.dart';

class FilaResultado extends StatelessWidget {
  final ClienteModel cliente;
  final int index;

  const FilaResultado({super.key, required this.cliente, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cliente #${index + 1}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Divider(),

            _buildDato('Saldo anterior:', cliente.saldoAnterior),
            _buildDato('Compras realizadas:', cliente.compras),
            _buildDato('Pago anterior:', cliente.pagoAnterior),
            _buildDato('Saldo actual:', cliente.saldoActual),
            _buildDato('Pago mínimo (15%):', cliente.pagoMinimo),
            _buildDato('Interés (12% si moroso):', cliente.interes),
            _buildDato('Multa (\$200 si moroso):', cliente.multa),
            const SizedBox(height: 8),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: (cliente.multa > 0)
                    ? Colors.redAccent.withOpacity(0.2)
                    : Colors.greenAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                (cliente.multa > 0)
                    ? 'Cliente MOROSO'
                    : 'Cliente al día',
                style: TextStyle(
                  color: (cliente.multa > 0)
                      ? Colors.red[700]
                      : Colors.green[700],
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget auxiliar para mostrar una fila de datos clave-valor
  Widget _buildDato(String titulo, double valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titulo,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            '\$${valor.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
