import 'package:flutter/material.dart';
import '../6_controller/6_controller.dart';

class DiscoView extends StatefulWidget {
  const DiscoView({super.key});

  @override
  State<DiscoView> createState() => _DiscoViewState();
}

class _DiscoViewState extends State<DiscoView> {
  final _controller = DiscoController();
  final _inputController = TextEditingController();

  Map<String, double>? resultados;

  void _convertir() {
    final texto = _inputController.text.trim();
    final gb = double.tryParse(texto);

    if (gb == null || gb <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Por favor ingrese un número válido mayor a 0'),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.red.shade400,
        ),
      );
      return;
    }

    _controller.setGigabytes(gb);
    setState(() {
      resultados = _controller.obtenerResultados();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor de Capacidad de Disco'),
        centerTitle: true,
        backgroundColor: Colors.purple.shade700,
        elevation: 4,
      ),
      body: SingleChildScrollView(
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
                        Icon(Icons.storage, color: Colors.purple),
                        SizedBox(width: 8),
                        Text(
                          'Conversión de Almacenamiento',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _inputController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Ingrese capacidad en Gigabytes',
                        hintText: 'Ej: 500, 1024, 256.5',
                        prefixIcon: const Icon(Icons.sd_storage),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _convertir,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple.shade700,
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
                            Icon(Icons.autorenew, size: 20),
                            SizedBox(width: 8),
                            Text(
                              'CONVERTIR CAPACIDAD',
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
            if (resultados != null && resultados!.isNotEmpty)
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
                          Icon(Icons.dashboard, color: Colors.orange),
                          SizedBox(width: 8),
                          Text(
                            'Resultados de Conversión',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
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
                            color: Colors.orange.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.orange.shade100),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  _formatearUnidad(e.key),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  _formatearValor(e.value),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade800,
                                  ),
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
                      Icons.storage_outlined,
                      size: 64,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Ingrese GB para convertir a otras unidades',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'MB, TB, KB, Bytes, etc.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
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

  String _formatearUnidad(String unidad) {
    // Personalizar la visualización de las unidades
    final Map<String, String> unidadesFormateadas = {
      'megabytes': 'Megabytes (MB)',
      'terabytes': 'Terabytes (TB)',
      'kilobytes': 'Kilobytes (KB)',
      'bytes': 'Bytes',
      'petabytes': 'Petabytes (PB)',
      'megabytes': 'Megabytes (MB)',
      'terabytes': 'Terabytes (TB)',
    };

    return unidadesFormateadas[unidad.toLowerCase()] ?? unidad;
  }

  String _formatearValor(double valor) {
    // Formatear el valor según su magnitud para mejor legibilidad
    if (valor >= 1000000) {
      return '${valor.toStringAsFixed(2)}';
    } else if (valor >= 1000) {
      return '${valor.toStringAsFixed(2)}';
    } else if (valor < 0.01) {
      return valor.toStringAsExponential(4);
    } else {
      return valor.toStringAsFixed(4);
    }
  }
}