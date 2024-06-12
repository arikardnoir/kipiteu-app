// ignore_for_file: unused_element

import 'package:flutter/material.dart';

import 'package:kipiteu_app/screens/account/card_details_screen.dart';
import 'package:kipiteu_app/screens/account/credit_debit_card_screen.dart';
import 'package:kipiteu_app/screens/account/pix_payment_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late SharedPreferences _prefs;
  late bool pixSelected;
  late bool paypalSelected;
  late bool creditCardSelected;

  @override
  void initState() {
    super.initState();
    _loadSelectedMethods();
  }

  Future<void> _loadSelectedMethods() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      pixSelected = _prefs.getBool('pixSelected') ?? false;
      paypalSelected = _prefs.getBool('paypalSelected') ?? false;
      creditCardSelected = _prefs.getBool('creditCardSelected') ?? false;
    });
  }

  Future<void> _saveSelectedMethods() async {
    await _prefs.setBool('pixSelected', pixSelected);
    await _prefs.setBool('paypalSelected', paypalSelected);
    await _prefs.setBool('creditCardSelected', creditCardSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Formas de pagamento',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              SizedBox(
                height: 80,
                width: 380,
                child: InkWell(
                  child: Card(
                    color: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.credit_card_rounded,
                              color: Colors.redAccent,
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 14,
                                ),
                                Text(
                                  'Cartão de crédito/débito',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CreditDebitCardScreen(
                          cardNumber: '',
                          expiryDate: '',
                          cardHolder: '',
                          ccv: '',
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 80,
                width: 380,
                child: InkWell(
                  child: Card(
                    color: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/icons/payment_icons/pix.png',
                                width: 20,
                                height: 20,
                              )),
                          const SizedBox(width: 5),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'PIX',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PixPaymentScreen(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPaymentCard({
    required String iconPath,
    required String title,
    required String cardNumber, // Novo parâmetro para o número do cartão
    required bool selected,
    required ValueChanged<bool?> onChanged,
  }) {
    return InkWell(
      child: Card(
        color: Colors.white,
        elevation: null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  iconPath,
                  width: 45,
                  height: 45,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    const SizedBox(height: 4.0),
                    Text(
                      cardNumber, // Exibe o número do cartão como subtítulo
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
              Transform.scale(
                scale: 1,
                child: Checkbox(
                  side: const BorderSide(width: 0.5),
                  activeColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  value: selected,
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CardDetailsScreen(
                cardNumber: cardNumber), // Aqui você passa o número do cartão
          ),
        );
      },
    );
  }
}
