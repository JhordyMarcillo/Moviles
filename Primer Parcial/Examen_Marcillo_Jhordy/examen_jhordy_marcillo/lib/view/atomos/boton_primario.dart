import 'package:flutter/material.dart';

class BotonPrimario extends StatelessWidget {
  final String texto;
  final void Function()? onPressed;

  const BotonPrimario({required this.texto, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(texto),
    );
  }
}
