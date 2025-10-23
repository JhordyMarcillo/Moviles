class ProduccionModel {
  final List<double> produccionSemanal;

  ProduccionModel({required this.produccionSemanal});

  double calcularPromedio() {
    double suma = produccionSemanal.reduce((a, b) => a + b);
    return suma / produccionSemanal.length;
  }

  bool recibeIncentivo() {
    return calcularPromedio() >= 100;
  }
}
