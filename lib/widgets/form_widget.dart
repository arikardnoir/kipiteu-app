import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  final Function(String) onChangedCardNumber;
  final Function(String) onChangedCardHolder;
  final Function(String) onChangedExpiryDate;
  final Function(String) onChangedCVV;

  const FormWidget({
    Key? key,
    required this.onChangedCardNumber,
    required this.onChangedCardHolder,
    required this.onChangedExpiryDate,
    required this.onChangedCVV,
  }) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController ccvController = TextEditingController();
  String? ccvError;
  String? dateError;
  String? nameError;

  @override
  void initState() {
    super.initState();
    cardNumberController.addListener(() {
      String cleanedNumber = cardNumberController.text.replaceAll(' ', '');
      widget.onChangedCardNumber(cleanedNumber);
    });
    cardHolderController.addListener(() {
      widget.onChangedCardHolder(cardHolderController.text);
    });
    expiryDateController.addListener(() {
      widget.onChangedExpiryDate(expiryDateController.text);
    });
    ccvController.addListener(() {
      widget.onChangedCVV(ccvController.text);
    });
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    cardHolderController.dispose();
    expiryDateController.dispose();
    ccvController.dispose();
    super.dispose();
  }

  String formatAndMaskCardNumber(String text) {
    String cleanedText = text.replaceAll(' ', '');
    if (cleanedText.length > 16) {
      cleanedText = cleanedText.substring(0, 16);
    }

    String maskedText = cleanedText.length > 8
        ? cleanedText.substring(0, 4) + '********' + cleanedText.substring(12)
        : cleanedText;

    String formattedText = '';
    for (int i = 0; i < maskedText.length; i++) {
      if (i > 0 && i % 4 == 0) {
        formattedText += ' ';
      }
      formattedText += maskedText[i];
    }
    return formattedText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          TextField(
            controller: cardNumberController,
            decoration: InputDecoration(
              labelText: 'Número do Cartão',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              contentPadding: const EdgeInsets.fromLTRB(12.0, 14.0, 12.0, 12.0),
            ),
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 16.0),
            onChanged: (text) {
              String formattedText = formatAndMaskCardNumber(text);
              if (formattedText.length > 19) {
                formattedText = formattedText.substring(0, 19);
              }
              cardNumberController.value = TextEditingValue(
                text: formattedText,
                selection:
                    TextSelection.collapsed(offset: formattedText.length),
              );
            },
          ),
          const SizedBox(height: 20),
          TextField(
            controller: cardHolderController,
            decoration: InputDecoration(
              labelText: 'Nome do Titular',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              contentPadding: const EdgeInsets.fromLTRB(12.0, 14.0, 12.0, 12.0),
              errorText: nameError,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Flexible(
                flex: 7,
                child: TextField(
                  controller: expiryDateController,
                  decoration: InputDecoration(
                    labelText: 'Data de Validade',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    contentPadding:
                        const EdgeInsets.fromLTRB(12.0, 14.0, 12.0, 12.0),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                flex: 5,
                child: TextField(
                  controller: ccvController,
                  decoration: InputDecoration(
                    labelText: 'CVV',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    contentPadding:
                        const EdgeInsets.fromLTRB(12.0, 14.0, 12.0, 12.0),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
