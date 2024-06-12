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
  String cardNumber = '1234567812345678';
  String cardHolderFullName = 'John Doe';
  String validThru = '01/28';
  String cvvNumber = '123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cartão'),
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
              /* cardProviderLogo: SizedBox(
                height: 25,
                width: 25,
                child: CardWidget(cardNumber: cardNumber),
              ), */
              //cardProviderLogoPosition: CardProviderLogoPosition.right,
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
              onChangedCVV: (value) {
                setState(() {
                  cvvNumber = value;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
