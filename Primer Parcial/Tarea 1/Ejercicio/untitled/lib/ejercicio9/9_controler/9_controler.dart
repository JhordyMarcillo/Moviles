import '../9_model/9_model.dart';


class ProduccionController {
  ProduccionModel? _modelo;

  void setProduccion(List<double> produccionSemanal) {
    _modelo = ProduccionModel(produccionSemanal: produccionSemanal);
  }

  double obtenerPromedio() {
    if (_modelo == null) return 0;
    return _modelo!.calcularPromedio();
  }

  String verificarIncentivo() {
    if (_modelo == null) return 'No hay datos registrados';
    return _modelo!.recibeIncentivo()
        ? 'El operario recibirá incentivo.'
        : 'El operario NO recibirá incentivo.';
  }
}
