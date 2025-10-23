class ConversionModel {
  final double metros;

  ConversionModel(this.metros);

  double get centimetros => metros * 100;
  double get pulgadas => centimetros / 2.54;
  double get pies => pulgadas / 12;
  double get yardas => pies / 3;
}
