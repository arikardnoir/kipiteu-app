class CardDateValidator {
  static String? validateCardDate(String value) {
    // Verifica se o valor está vazio
    if (value.isEmpty) {
      return '';
    }

    // Verifica se a data do cartão tem o formato correto (MM/YY)
    if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(value)) {
      return 'Formato inválido para data do cartão (MM/YY)';
    }

    // Verifica se o mês é válido (entre 1 e 12)
    final parts = value.split('/');
    final month = int.tryParse(parts[0]);
    if (month == null || month < 1 || month > 12) {
      return 'Mês inválido';
    }

    // Verifica se o ano é válido (dois dígitos)
    final year = int.tryParse(parts[1]);
    if (year == null || year < 0 || year > 99) {
      return 'Ano inválido';
    }

    // Verifica se a data é futura
    final currentYear = DateTime.now().year % 100;
    final currentMonth = DateTime.now().month;
    if (year < currentYear || (year == currentYear && month < currentMonth)) {
      return 'Data do cartão expirada';
    }

    // Se todas as verificações passarem, retorna null (ou seja, data do cartão válida)
    return null;
  }
}
