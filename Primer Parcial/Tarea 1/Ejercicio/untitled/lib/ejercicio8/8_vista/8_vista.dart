import 'package:flutter/material.dart';
import '../8_controler/8_controler.dart';

class FinancieraView extends StatefulWidget {
  const FinancieraView({super.key});

  @override
  State<FinancieraView> createState() => _FinancieraViewState();
}

class _FinancieraViewState extends State<FinancieraView> {
  final _controller = FinancieraController();
  final _inputController = TextEditingController();
  Map<String, dynamic>? resultados;

  void _calcular() {
    final texto = _inputController.text.trim();
    final monto = double.tryParse(texto);

    if (monto == null || monto <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Por favor ingrese un monto válido mayor a 0'),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.red.shade400,
        ),
      );
      return;
    }

    _controller.setMonto(monto);
    setState(() {
      resultados = _controller.obtenerResultados();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Préstamos'),
        centerTitle: true,
        backgroundColor: Colors.teal.shade700,
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
                        Icon(Icons.account_balance_wallet, color: Colors.teal),
                        SizedBox(width: 8),
                        Text(
                          'Simulación de Préstamo',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _inputController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Monto del préstamo',
                        hintText: 'Ej: 10000, 5000, 25000',
                        prefixIcon: const Icon(Icons.attach_money),
                        prefixText: '\$ ',
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
                        onPressed: _calcular,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal.shade700,
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
                            Icon(Icons.calculate, size: 20),
                            SizedBox(width: 8),
                            Text(
                              'CALCULAR CUOTA',
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
                          Icon(Icons.pie_chart, color: Colors.indigo),
                          SizedBox(width: 8),
                          Text(
                            'Detalles del Préstamo',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ...resultados!.entries.map((e) {
                        final bool isMonetary = _esCampoMonetario(e.key);
                        final bool isImportant = _esCampoImportante(e.key);

                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isImportant
                                ? Colors.indigo.shade50
                                : Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isImportant
                                  ? Colors.indigo.shade100
                                  : Colors.grey.shade300,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _formatearEtiqueta(e.key),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: isImportant
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _formatearValor(e.value, e.key),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: isImportant
                                            ? Colors.indigo.shade800
                                            : Colors.grey.shade800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (isImportant)
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.indigo.shade100,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    _obtenerIconoCampo(e.key),
                                    size: 20,
                                    color: Colors.indigo.shade700,
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
                      Icons.credit_score_outlined,
                      size: 64,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Ingrese el monto para calcular su préstamo',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Cuota mensual, intereses, plazo, etc.',
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

  bool _esCampoMonetario(String key) {
    final monetaryFields = ['cuota', 'monto', 'interes', 'total', 'pago'];
    return monetaryFields.any((field) => key.toLowerCase().contains(field));
  }

  bool _esCampoImportante(String key) {
    final importantFields = ['cuota', 'monto', 'interes total', 'plazo'];
    return importantFields.any((field) => key.toLowerCase().contains(field));
  }

  String _formatearEtiqueta(String key) {
    final Map<String, String> labels = {
      'cuota': 'CUOTA MENSUAL',
      'monto': 'MONTO DEL PRÉSTAMO',
      'interes': 'TASA DE INTERÉS',
      'plazo': 'PLAZO',
      'total': 'TOTAL A PAGAR',
      'pago': 'PAGO TOTAL',
    };

    return labels[key.toLowerCase()] ?? key.toUpperCase();
  }

  String _formatearValor(dynamic value, String key) {
    if (value is double) {
      if (_esCampoMonetario(key)) {
        return '\$${value.toStringAsFixed(2)}';
      } else if (key.toLowerCase().contains('interes') && !key.toLowerCase().contains('total')) {
        return '${value.toStringAsFixed(2)}%';
      } else {
        return value.toStringAsFixed(2);
      }
    }
    return value.toString();
  }

  IconData _obtenerIconoCampo(String key) {
    final iconMap = {
      'cuota': Icons.payment,
      'monto': Icons.attach_money,
      'interes': Icons.trending_up,
      'plazo': Icons.calendar_today,
      'total': Icons.account_balance_wallet,
    };

    return iconMap[key.toLowerCase()] ?? Icons.info;
  }
}