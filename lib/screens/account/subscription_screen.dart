// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  bool _isCheckedFree = true;
  bool _isCheckedStandard = false;
  bool _isCheckedPremium = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Planos',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCard(
              title: 'Grátis',
              description: 'Tens receitas para três dias',
              price: '',
              isChecked: _isCheckedFree,
              onTap: () {
                setState(() {
                  _isCheckedFree = true;
                  _isCheckedStandard = false;
                  _isCheckedPremium = false;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildCard(
              title: 'Padrão',
              description: 'Tens receitas para cinco dias',
              price: '10 R\$ por Mês',
              isChecked: _isCheckedStandard,
              onTap: () {
                setState(() {
                  _isCheckedFree = false;
                  _isCheckedStandard = true;
                  _isCheckedPremium = false;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildCard(
              title: 'Premium',
              description: 'Tens receitas para sete dias',
              price: '15 R\$ por Mês',
              isChecked: _isCheckedPremium,
              onTap: () {
                setState(() {
                  _isCheckedFree = false;
                  _isCheckedStandard = false;
                  _isCheckedPremium = true;
                });
              },
            ),
            const SizedBox(
                height: 300), // Space between the card and the button
            SizedBox(
              height: 60,
              width: 390,
              child: ElevatedButton(
                onPressed: () {
                  /* Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SubscriptionScreen(),
                    ),
                  ); */
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  fixedSize: const Size.fromHeight(48),
                ),
                child: const Text(
                  'Continuar',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String description,
    required String price,
    required bool isChecked,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: isChecked ? Colors.redAccent : Colors.grey,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  if (price.isNotEmpty) const SizedBox(height: 8),
                  if (price.isNotEmpty)
                    Text(
                      price,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: isChecked ? Colors.redAccent : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isChecked ? Colors.redAccent : Colors.grey,
                  ),
                ),
                child: isChecked
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
