import '../10_model/10_model.dart';

class SupermercadoController {
  SupermercadoModel? _modelo;

  // Inicializa el modelo con los datos ingresados
  void setDatos(double totalCompra, int numeroEscogido) {
    _modelo = SupermercadoModel(
      totalCompra: totalCompra,
      numeroEscogido: numeroEscogido,
    );
  }

  // Devuelve los resultados de forma segura
  Map<String, dynamic>? obtenerResultados() {
    if (_modelo == null) return null;

    return {
      'Total de compra': _modelo!.totalCompra,
      'Número escogido': _modelo!.numeroEscogido,
      'Porcentaje de descuento': '${_modelo!.porcentajeAplicado}%',
      'Descuento aplicado': _modelo!.descuento,
      'Total a pagar': _modelo!.totalPagar,
    };
  }
}
