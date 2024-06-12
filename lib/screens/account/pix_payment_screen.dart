// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';

class PixPaymentScreen extends StatefulWidget {
  const PixPaymentScreen({super.key});

  @override
  _PixPaymentScreenState createState() => _PixPaymentScreenState();
}

class _PixPaymentScreenState extends State<PixPaymentScreen> {
  final _amountController = TextEditingController();
  final _pixCodeController = TextEditingController();

  void _handlePayment() {
    final amount = _amountController.text;
    final pixCode = _pixCodeController.text;

    // Aqui você pode adicionar a lógica para processar o pagamento
    print('Pagamento de R\$ $amount para o código Pix: $pixCode');

    // Mostra uma mensagem de confirmação
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pagamento Confirmado'),
          content: Text('Você pagou R\$ $amount para o código Pix: $pixCode'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagamento Pix'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: 355,
              child: TextField(
                controller: _amountController,
                decoration: const InputDecoration(
                  labelText: 'Valor',
                  prefixText: 'R\$ ',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 355,
              child: TextField(
                controller: _pixCodeController,
                decoration: const InputDecoration(
                  labelText: 'Código Pix',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: 355,
              child: ElevatedButton(
                onPressed: () {
                  _handlePayment();
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
                  'Confirmar pagamento',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
