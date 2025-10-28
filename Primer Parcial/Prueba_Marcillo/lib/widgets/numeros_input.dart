import 'package:flutter/material.dart';

class NumberInputList extends StatelessWidget {
  final List<TextEditingController> controllers;

  const NumberInputList({required this.controllers});

  //generación de la lista de inputs
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(controllers.length, (i) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: controllers[i],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Número ${i + 1}',
              border: OutlineInputBorder(),
            ),
          ),
        );
      }),
    );
  }
}
