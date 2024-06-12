// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

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
    cardNumberController.addListener(() {
      widget.onChangedCardNumber(cardNumberController.text);
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
              //CardWidget(cardNumber: cardNumberController.text),
            ],
          ),
        ],
      ),
    );
  }
}
