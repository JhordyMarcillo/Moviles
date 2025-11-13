import 'package:flutter/material.dart';
import '../atomos/campo_texto.dart';
import '../atomos/boton_primario.dart';
import '../../utils/validaciones.dart';

class FormularioCliente extends StatefulWidget {
  final void Function(double saldoAnterior, double compras, double pagoAnterior) onSubmit;

  FormularioCliente({required this.onSubmit});

  @override
  _FormularioClienteState createState() => _FormularioClienteState();
}

class _FormularioClienteState extends State<FormularioCliente> {
  final _formKey = GlobalKey<FormState>();
  final _saldoCtrl = TextEditingController();
  final _comprasCtrl = TextEditingController();
  final _pagoCtrl = TextEditingController();

  @override
  void dispose() {
    _saldoCtrl.dispose();
    _comprasCtrl.dispose();
    _pagoCtrl.dispose();
    super.dispose();
  }

  void _enviar() {
    if (_formKey.currentState?.validate() ?? false) {
      final saldo = double.parse(_saldoCtrl.text.replaceAll(',', '.'));
      final compras = double.parse(_comprasCtrl.text.replaceAll(',', '.'));
      final pago = double.parse(_pagoCtrl.text.replaceAll(',', '.'));
      widget.onSubmit(saldo, compras, pago);
      _saldoCtrl.clear();
      _comprasCtrl.clear();
      _pagoCtrl.clear();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CampoTexto(label: 'Saldo anterior', controller: _saldoCtrl, validator: validarPositivo),
          SizedBox(height: 8),
          CampoTexto(label: 'Compras', controller: _comprasCtrl, validator: validarPositivo),
          SizedBox(height: 8),
          CampoTexto(label: 'Pago anterior', controller: _pagoCtrl, validator: validarPositivo),
          SizedBox(height: 12),
          BotonPrimario(texto: 'Calcular cliente', onPressed: _enviar),
        ],
      ),
    );
  }
}
