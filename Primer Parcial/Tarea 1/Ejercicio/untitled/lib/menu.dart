import 'package:flutter/material.dart';
import './ejercicio5/5_vista/5_vista.dart';
import './ejercicio6/6_vista/6_vista.dart';
import './ejercicio8/8_vista/8_vista.dart';
import './ejercicio9/9_vista/9_vista.dart';
import './ejercicio10/10_vista/10_vista.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final ejercicios = [
      {
        'titulo': 'Conversión de Medidas',
        'subtitulo': 'Metros a otras unidades',
        'vista': const ConversionView(),
        'icono': Icons.straighten,
        'color': Colors.blue,
        'numero': '5'
      },
      {
        'titulo': 'Capacidad de Disco',
        'subtitulo': 'GB a MB, TB, KB, Bytes',
        'vista': const DiscoView(),
        'icono': Icons.storage,
        'color': Colors.purple,
        'numero': '6'
      },
      {
        'titulo': 'Cálculo de Préstamos',
        'subtitulo': 'Simulación de cuotas',
        'vista': const FinancieraView(),
        'icono': Icons.account_balance_wallet,
        'color': Colors.teal,
        'numero': '8'
      },
      {
        'titulo': 'Control de Producción',
        'subtitulo': 'Promedio semanal e incentivos',
        'vista': const ProduccionView(),
        'icono': Icons.assessment,
        'color': Colors.blue,
        'numero': '9'
      },
      {
        'titulo': 'Descuentos Supermercado',
        'subtitulo': 'Cálculo de promociones',
        'vista': const SupermercadoView(),
        'icono': Icons.local_offer,
        'color': Colors.orange,
        'numero': '10'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Suite de Calculadoras'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade700,
        elevation: 4,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              _mostrarInformacion(context);
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade50,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            // Header informativo
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade700,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.calculate_rounded,
                    size: 48,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Herramientas de Cálculo',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Lista de ejercicios
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  itemCount: ejercicios.length,
                  itemBuilder: (context, index) {
                    final ejercicio = ejercicios[index];
                    final color = ejercicio['color'] as Color;

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            if (ejercicio['vista'] != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ejercicio['vista'] as Widget,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('Ejercicio aún no implementado'),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                // Número e ícono
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: color.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: color.withOpacity(0.3),
                                      width: 2,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        ejercicio['numero'] as String,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: color,
                                        ),
                                      ),
                                      Icon(
                                        ejercicio['icono'] as IconData,
                                        size: 20,
                                        color: color,
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(width: 16),

                                // Información del ejercicio
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ejercicio['titulo'] as String,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        ejercicio['subtitulo'] as String,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Flecha de navegación
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: color.withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                    color: color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarInformacion(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.info, color: Colors.deepPurple),
            SizedBox(width: 8),
            Text('Información'),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Suite de Calculadoras',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Esta aplicación contiene diversas herramientas de cálculo especializadas para diferentes necesidades:',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 12),
            Text(
              '• Conversión de unidades\n'
                  '• Cálculos financieros\n'
                  '• Control de producción\n'
                  '• Promociones comerciales',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}