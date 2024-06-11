class CardNumberValidator {
  static String? validateCardNumber(String value) {
    // Remove espaços em branco e caracteres não numéricos
    final cardNumber = value.replaceAll(RegExp(r'\s+\b|\b\s'), '');

    // Verifica se o valor está vazio
    if (cardNumber.isEmpty) {
      return 'Número do cartão não pode estar vazio';
    }

    // Verifica se o número do cartão tem entre 13 e 19 dígitos
    if (cardNumber.length < 13 || cardNumber.length > 19) {
      return 'Número do cartão inválido';
    }

    // Verifica se o número do cartão passa pelo algoritmo de Luhn
    if (!_luhnCheck(cardNumber)) {
      return 'Número do cartão inválido';
    }

    // Se todas as verificações passarem, retorna null (ou seja, número do cartão válido)
    return null;
  }

  static bool _luhnCheck(String cardNumber) {
    int sum = 0;
    bool isEven = false;

    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int digit = int.parse(cardNumber[i]);

      if (isEven) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }

      sum += digit;
      isEven = !isEven;
    }

    return sum % 10 == 0;
  }
}
