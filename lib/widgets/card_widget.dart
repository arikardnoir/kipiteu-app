import 'package:flutter/material.dart';

class CreditCardType {
  static String detectCardType(String cardNumber) {
    if (RegExp(r'^4[0-9]{12}(?:[0-9]{3})?$').hasMatch(cardNumber)) {
      return 'Visa';
    } else if (RegExp(r'^5[1-5][0-9]{14}$').hasMatch(cardNumber)) {
      return 'MasterCard';
    } else if (RegExp(r'^3[47][0-9]{13}$').hasMatch(cardNumber)) {
      return 'American Express';
    } else {
      return 'Unknown';
    }
  }
}

class CardWidget extends StatelessWidget {
  final String cardNumber;

  const CardWidget({super.key, required this.cardNumber});

  @override
  Widget build(BuildContext context) {
    String cardType = CreditCardType.detectCardType(cardNumber);
    String imagePath;

    switch (cardType) {
      case 'Visa':
        imagePath =
            'assets/icons/payment_icons/visa.png'; // Substitua pelo caminho real da imagem Visa
        break;
      case 'MasterCard':
        imagePath =
            'assets/icons/payment_icons/mastercard.png'; // Substitua pelo caminho real da imagem MasterCard
        break;
      case 'American Express':
        imagePath =
            'assets/icons/payment_icons/american_express.png'; // Substitua pelo caminho real da imagem American Express
        break;
      default:
        imagePath =
            ''; // Substitua pelo caminho real da imagem de cartão desconhecido
        break;
    }

    return Image.asset(
      imagePath,
      width: 25,
      height: 25,
    );
  }
}
