import 'package:flutter/material.dart';
import '../10_controler/10_controler.dart';

class SupermercadoView extends StatefulWidget {
  const SupermercadoView({super.key});

  @override
  State<SupermercadoView> createState() => _SupermercadoViewState();
}

class _SupermercadoViewState extends State<SupermercadoView> {
  final _controller = SupermercadoController();
  final _compraController = TextEditingController();
  final _numeroController = TextEditingController();

  Map<String, dynamic>? resultados;

  void _calcularDescuento() {
    // Intentar convertir los inputs a double/int
    final totalCompra = double.tryParse(_compraController.text.trim());
    final numeroEscogido = int.tryParse(_numeroController.text.trim());

    // Validación de entradas
    if (totalCompra == null || totalCompra <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ingrese un total de compra válido')),
      );
      return;
    }
    if (numeroEscogido == null || numeroEscogido < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ingrese un número válido')),
      );
      return;
    }

    // Configurar el controlador
    _controller.setDatos(totalCompra, numeroEscogido);

    // Obtener resultados y actualizar la vista
    setState(() {
      resultados = _controller.obtenerResultados();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promociones Supermercado'),
        centerTitle: true,
        backgroundColor: Colors.orange.shade700,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Tarjeta de entrada
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.local_offer, color: Colors.orange),
                        SizedBox(width: 8),
                        Text(
                          'Calculadora de Descuentos',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _compraController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Total de la compra',
                        hintText: 'Ej: 150.00',
                        prefixIcon: const Icon(Icons.shopping_cart),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _numeroController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Número escogido',
                        hintText: 'Ej: 5, 12, 8',
                        prefixIcon: const Icon(Icons.confirmation_number),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _calcularDescuento,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade700,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.percent, size: 20),
                            SizedBox(width: 8),
                            Text(
                              'CALCULAR DESCUENTO',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Resultados
            if (resultados != null)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.receipt_long, color: Colors.green),
                          SizedBox(width: 8),
                          Text(
                            'Resultados de la Compra',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ...resultados!.entries.map((e) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  _formatearEtiqueta(e.key),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                e.value is double ?
                                _formatearValor(e.value, e.key) :
                                e.value.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: _obtenerColor(e.key),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),

            // Mensaje cuando no hay resultados
            if (resultados == null)
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Icon(
                      Icons.shopping_basket_outlined,
                      size: 64,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Ingrese los datos para calcular su descuento',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _formatearEtiqueta(String key) {
    final Map<String, String> etiquetas = {
      'total_compra': 'Total Original',
      'porcentaje_descuento': 'Descuento Aplicado',
      'monto_descuento': 'Monto Descontado',
      'total_pagar': 'Total a Pagar',
    };
    return etiquetas[key] ?? key;
  }

  String _formatearValor(double value, String key) {
    if (key == 'porcentaje_descuento') {
      return '${value.toStringAsFixed(2)}%';
    } else {
      return '\$${value.toStringAsFixed(2)}';
    }
  }

  Color _obtenerColor(String key) {
    switch (key) {
      case 'total_compra':
        return Colors.grey.shade700;
      case 'porcentaje_descuento':
        return Colors.blue.shade700;
      case 'monto_descuento':
        return Colors.red.shade700;
      case 'total_pagar':
        return Colors.green.shade700;
      default:
        return Colors.black;
    }
  }
}