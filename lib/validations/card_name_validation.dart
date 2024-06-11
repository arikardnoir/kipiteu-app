class CardNameValidator {
  static String? validateCardName(String value) {
    // Verifica se o valor está vazio
    if (value.isEmpty) {
      return '';
    }

    // Verifica se o nome tem pelo menos dois sobrenomes
    final parts = value.trim().split(' ');
    if (parts.length < 2) {
      return 'Por favor, forneça o nome conforme no cartão';
    }

    // Se todas as verificações passarem, retorna null (ou seja, nome do cartão válido)
    return null;
  }
}
