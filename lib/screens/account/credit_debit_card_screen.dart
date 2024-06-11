// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:kipiteu_app/widgets/form_widget.dart';
import 'package:u_credit_card/u_credit_card.dart';

class CreditDebitCardScreen extends StatefulWidget {
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;
  final String ccv;

  const CreditDebitCardScreen({
    super.key,
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
    required this.ccv,
  });

  @override
  State<CreditDebitCardScreen> createState() => _CreditDebitCardScreenState();
}

class _CreditDebitCardScreenState extends State<CreditDebitCardScreen> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController ccvController = TextEditingController();

  String cardNumber = '1234567812345678';
  String cardHolderFullName = 'John Doe';
  String validThru = '01/28';
  String cvvNumber = '123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cartão de crédito/débito'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            CreditCardUi(
              cardNumber: cardNumber,
              cardHolderFullName: cardHolderFullName,
              validThru: validThru,
              cvvNumber: cvvNumber,
              topLeftColor: Colors.black,
              bottomRightColor: Colors.blue,
              cardProviderLogo: const Icon(Icons.monetization_on),
              cardProviderLogoPosition: CardProviderLogoPosition.right,
              enableFlipping: true,
            ),
            FormWidget(
              onChangedCardNumber: (value) {
                setState(() {
                  cardNumber = value;
                });
              },
              onChangedCardHolder: (value) {
                setState(() {
                  cardHolderFullName = value;
                });
              },
              onChangedExpiryDate: (value) {
                setState(() {
                  validThru = value;
                });
              },
              onChangedCCV: (value) {
                setState(() {
                  cvvNumber = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
