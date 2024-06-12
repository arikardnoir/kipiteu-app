// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormWidget extends StatefulWidget {
  final Function(String) onChangedCardNumber;
  final Function(String) onChangedCardHolder;
  final Function(String) onChangedExpiryDate;
  final Function(String) onChangedCVV;

  const FormWidget({
    super.key,
    required this.onChangedCardNumber,
    required this.onChangedCardHolder,
    required this.onChangedExpiryDate,
    required this.onChangedCVV,
  });

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
    _loadCardData();
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

  void _saveCardData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cardNumber', cardNumberController.text);
    await prefs.setString('cardHolder', cardHolderController.text);
    await prefs.setString('expiryDate', expiryDateController.text);
    await prefs.setString('cvv', ccvController.text);

    Navigator.pop(context);
  }

  void _clearCardData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('cardNumber');
    await prefs.remove('cardHolder');
    await prefs.remove('expiryDate');
    await prefs.remove('cvv');

    Navigator.pop(context);
  }

  void _loadCardData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cardNumber = prefs.getString('cardNumber');
    String? cardHolder = prefs.getString('cardHolder');
    String? expiryDate = prefs.getString('expiryDate');
    String? cvv = prefs.getString('cvv');

    if (cardNumber != null) {
      cardNumberController.text = cardNumber;
    }
    if (cardHolder != null) {
      cardHolderController.text = cardHolder;
    }
    if (expiryDate != null) {
      expiryDateController.text = expiryDate;
    }
    if (cvv != null) {
      ccvController.text = cvv;
    }
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
        ? '${cleanedText.substring(0, 4)}********${cleanedText.substring(12)}'
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
                  onChanged: (text) {
                    if (text.length == 2 && !text.contains('/')) {
                      expiryDateController.text = '$text/';
                      expiryDateController.selection =
                          TextSelection.fromPosition(TextPosition(
                              offset: expiryDateController.text.length));
                    }
                    if (text.length > 5) {
                      expiryDateController.value = TextEditingValue(
                        text: text.substring(0, 5),
                        selection: TextSelection.collapsed(offset: text.length),
                      );
                    }
                  },
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
                  onChanged: (text) {
                    if (text.length > 4) {
                      ccvController.value = TextEditingValue(
                        text: text.substring(0, 4),
                        selection: TextSelection.collapsed(offset: text.length),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 50,
            width: 330,
            child: ElevatedButton(
              onPressed: () {
                _saveCardData();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                fixedSize: const Size.fromHeight(18),
              ),
              child: const Text(
                'Salvar',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 50,
            width: 330,
            child: ElevatedButton(
              onPressed: () {
                _clearCardData();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                fixedSize: const Size.fromHeight(18),
              ),
              child: const Text(
                'Eliminar',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
