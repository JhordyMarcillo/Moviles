import 'package:flutter/material.dart';

class TextoResultado extends StatelessWidget {
  final String label;
  final String valor;

  const TextoResultado({required this.label, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$label: ', style: Theme.of(context).textTheme.labelLarge),
        Expanded(child: Text(valor, style: Theme.of(context).textTheme.bodyMedium)),
      ],
    );
  }
}
