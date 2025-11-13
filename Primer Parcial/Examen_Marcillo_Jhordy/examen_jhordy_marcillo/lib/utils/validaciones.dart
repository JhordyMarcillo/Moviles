String? validarPositivo(String? valor) {
  if (valor == null || valor.isEmpty) return 'Campo obligatorio';
  final numero = double.tryParse(valor);
  if (numero == null || numero < 0) return 'Ingrese un número válido positivo';
  return null;
}
