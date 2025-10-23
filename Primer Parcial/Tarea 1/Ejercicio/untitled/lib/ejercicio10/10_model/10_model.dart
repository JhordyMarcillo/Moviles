class SupermercadoModel {
  final double totalCompra;
  final int numeroEscogido;

  SupermercadoModel({
    required this.totalCompra,
    required this.numeroEscogido,
  });

  // Calcula el descuento según el número escogido
  double get descuento {
    if (numeroEscogido < 74) {
      return totalCompra * 0.15;
    } else {
      return totalCompra * 0.20;
    }
  }

  // Devuelve el porcentaje aplicado
  double get porcentajeAplicado => numeroEscogido < 74 ? 15 : 20;

  // Total a pagar después del descuento
  double get totalPagar => totalCompra - descuento;
}
