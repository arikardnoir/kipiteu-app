class CVVValidator {
  // Método para validar o CVV
  static String? validateCVV(String value) {
    // Verifica se o valor está vazio
    if (value.isEmpty) {
      return '';
    }

    // Verifica se o CVV tem 3 ou 4 dígitos
    if (value.length != 3 && value.length != 4) {
      return 'CVV deve ter 3 ou 4 dígitos';
    }

    // Verifica se o CVV contém apenas dígitos
    if (!RegExp(r'^\d{3,4}$').hasMatch(value)) {
      return 'CVV deve conter apenas dígitos';
    }

    // Se todas as verificações passarem, retorna null (ou seja, CVV válido)
    return null;
  }
}
