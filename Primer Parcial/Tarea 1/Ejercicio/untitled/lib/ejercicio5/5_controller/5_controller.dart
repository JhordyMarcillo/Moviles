import '../5_model/5_model.dart';
import '../5_vista/5_vista.dart';


class ConversionController {
  ConversionModel? _model;

  void setMetros(double metros) {
    _model = ConversionModel(metros);
  }

  Map<String, double>? obtenerResultados() {
    if (_model == null) return null;

    return {
      'centímetros': _model!.centimetros,
      'pulgadas': _model!.pulgadas,
      'pies': _model!.pies,
      'yardas': _model!.yardas,
    };
  }
}