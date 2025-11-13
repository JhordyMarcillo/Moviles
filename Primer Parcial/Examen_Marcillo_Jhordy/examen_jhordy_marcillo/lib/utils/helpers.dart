String formatoMoneda(double value) {
  // Simple formateo, puedes usar intl si prefieres
  return '\$' + value.toStringAsFixed(2);
}
