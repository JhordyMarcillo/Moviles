import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //utiliza dynamic para convertir en cast a la otra pantalla
    final Map<String, dynamic> data =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text('Resultados')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Números: ${data['numeros']}"),
            SizedBox(height: 20),
            Text("Numeros menores que 15: ${data['menores15']}"),
            Text("Numeros mayores que 50: ${data['mayores50']}"),
            Text("Numeros entre 25 y 45: ${data['entre25y45']}"),
            Text("Promedio: ${data['promedio']}"),
          ],
        ),
      ),
    );
  }
}

class ResultArgs {
  final List<int> numeros;
  final int menores15;
  final int mayores50;
  final int entre25_45;
  final double promedio;

  ResultArgs(this.numeros, this.menores15, this.mayores50, this.entre25_45, this.promedio);
}

