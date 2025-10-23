import '../6_model/6_model.dart';

class DiscoController {
  DiscoModel? _model;

  void setGigabytes(double gb) {
    _model = DiscoModel(gb);
  }

  Map<String, double>? obtenerResultados() {
    if (_model == null) return null;

    return {
      'Megabytes': _model!.megabytes,
      'Kilobytes': _model!.kilobytes,
      'Bytes': _model!.bytes,
    };
  }
}
