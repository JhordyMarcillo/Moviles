import '../8_model/8_model.dart';

class FinancieraController {
  FinancieraModel? _model;

  void setMonto(double monto) {
    _model = FinancieraModel(monto);
  }

  Map<String, dynamic>? obtenerResultados() {
    if (_model == null) return null;

    return {
      'Monto ingresado': _model!.monto,
      'Porcentaje aplicado': '${_model!.porcentaje}%',
      'Cuota a pagar': _model!.cuota,
    };
  }
}
