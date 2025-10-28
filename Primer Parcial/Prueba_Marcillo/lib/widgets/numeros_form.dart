import 'package:flutter/material.dart';
import '../controller/numeros_controller.dart';
import '../model/numeros_model.dart';
import './botones.dart';
import './numeros_input.dart';

class NumbersForm extends StatefulWidget {
  @override
  _NumbersFormState createState() => _NumbersFormState();
}

class _NumbersFormState extends State<NumbersForm> {
  final TextEditingController _cantidadController = TextEditingController();
  final NumberController _controller = NumberController();
  List<TextEditingController> _numberControllers = [];

  //genera los campos para el inrgeso de num
  void _generarCampos() {
    final n = int.tryParse(_cantidadController.text);
    if (n == null || n <= 0) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Ingrese solo numero entero")));
      return;
    }
    setState(() {
      _numberControllers =
          List.generate(n, (_) => TextEditingController());
    });
  }

  //se calcula y valida los numeros
  void _calcularResultados() {
    List<int> numeros = [];

    for (var c in _numberControllers) {
      if (c.text.isEmpty || int.tryParse(c.text) == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Ingrese solo números válidos.")),
        );
        return;
      }
      numeros.add(int.parse(c.text));
    }

    Navigator.pushNamed(context, '/result', arguments: {
      'numeros': numeros,
      'menores15': _controller.menores15(numeros),
      'mayores50': _controller.mayores50(numeros),
      'entre25y45': _controller.entre25_45(numeros),
      'promedio': _controller.promedio(numeros),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _cantidadController,
          decoration: InputDecoration(labelText: "Numeros a ingresar"),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 10),
        CustomButton(
          text: "Generar números",
          onPressed: _generarCampos,
        ),
        SizedBox(height: 10),
        //Se usa para desplegar los numeros
        if (_numberControllers.isNotEmpty)
          NumberInputList(controllers: _numberControllers),
        //el boton de analizar
        if (_numberControllers.isNotEmpty)
          CustomButton(text: "Analizar", onPressed: _calcularResultados),
      ],
    );
  }
}
