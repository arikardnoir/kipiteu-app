import 'package:flutter/material.dart';
import 'package:kipiteu_app/screens/account/add_card_screen.dart';
import 'package:kipiteu_app/screens/account/card_details_screen.dart';
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
              const SizedBox(height: 50),
              buildPaymentCard(
                iconPath: 'assets/icons/payment_icons/pix.png',
                title: 'Pix',
                subtitle: '114251162*******',
                selected: pixSelected,
                onChanged: (bool? value) {
                  setState(() {
                    pixSelected = value!;
                    if (pixSelected) {
                      paypalSelected = false;
                      creditCardSelected = false;
                    }
                    _saveSelectedMethods();
                  });
                },
              ),
              const SizedBox(height: 10),
              buildPaymentCard(
                iconPath: 'assets/icons/payment_icons/paypal.png',
                title: 'Paypal',
                subtitle: '843251162*******',
                selected: paypalSelected,
                onChanged: (bool? value) {
                  setState(() {
                    paypalSelected = value!;
                    if (paypalSelected) {
                      pixSelected = false;
                      creditCardSelected = false;
                    }
                    _saveSelectedMethods();
                  });
                },
              ),
              const SizedBox(height: 10),
              buildPaymentCard(
                iconPath: 'assets/icons/payment_icons/mastercard.png',
                title: 'CreditCard',
                subtitle: '643221362*******',
                selected: creditCardSelected,
                onChanged: (bool? value) {
                  setState(() {
                    creditCardSelected = value!;
                    if (creditCardSelected) {
                      pixSelected = false;
                      paypalSelected = false;
                    }
                    _saveSelectedMethods();
                  });
                },
              ),
              const SizedBox(
                  height: 200), // Space between the card and the button
              SizedBox(
                height: 50,
                width: 370,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement your payment logic here
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
                    'Pagar',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 370,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddCardScreen(),
                      ),
                    );
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
                    'Adicionar cartão',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPaymentCard({
    required String iconPath,
    required String title,
    required String subtitle,
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
                  width: 50,
                  height: 50,
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
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
              Transform.scale(
                scale: 1.2,
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
            builder: (context) => const CardDetailsScreen(),
          ),
        );
      },
    );
  }
}
