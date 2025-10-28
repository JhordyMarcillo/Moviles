import 'package:flutter/material.dart';
import '../widgets/numeros_form.dart';

class Numeros_View extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Numero a Ingresar"),
        centerTitle: true,
      ),

      body: Padding(
          padding: const EdgeInsets.all(16),
        child: NumbersForm(),
      ),
    );
  }
}