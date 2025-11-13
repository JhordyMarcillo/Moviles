class ClienteModel {
  double saldoAnterior;
  double compras;
  double pagoAnterior;
  double saldoActual = 0.0;
  double pagoMinimo = 0.0;
  double pagoTotal = 0.0;
  double interes = 0.0;
  double multa = 0.0;

  ClienteModel({
    required this.saldoAnterior,
    required this.compras,
    required this.pagoAnterior,
  });

  void calcularSaldoActual() {
    saldoActual = saldoAnterior + compras - pagoAnterior;
  }

  void calcularPagos() {
    pagoMinimo = saldoActual * 0.15;
    pagoTotal = saldoActual * 0.85;
  }

  void calcularInteresYMulta() {
    if (pagoAnterior < pagoMinimo) {
      interes = saldoActual * 0.12;
      multa = 200.0;
      saldoActual = saldoActual + interes + multa;
    } else {
      interes = 0.0;
      multa = 0.0;
    }
  }

  void calcularTodo() {
    calcularSaldoActual();
    calcularPagos();
    calcularInteresYMulta();
  }
}
