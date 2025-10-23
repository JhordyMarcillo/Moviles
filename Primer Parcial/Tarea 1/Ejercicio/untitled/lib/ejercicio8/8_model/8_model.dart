class FinancieraModel {
  final double monto;

  FinancieraModel(this.monto);

  double get cuota {
    if (monto < 50000) {
      return monto * 0.03;
    } else {
      return monto * 0.02;
    }
  }

  double get porcentaje => monto < 50000 ? 3 : 2;
}
