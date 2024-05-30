// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  Future<void> _saveCardDetails() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('cardName', _nameController.text);
    await prefs.setString('cardNumber', _numberController.text);
    await prefs.setString('cardDate', _dateController.text);
    await prefs.setString('cardCode', _codeController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Detalhes do cartão salvos com sucesso!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Adicionar cartão'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Digite os detalhes do cartao',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 350,
                child: TextField(
                  keyboardType: TextInputType.name,
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: 'Nome do proprietário',
                    labelStyle: TextStyle(color: Colors.black),
                    contentPadding: EdgeInsets.fromLTRB(12.0, 14.0, 12.0, 12.0),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: 350,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _numberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: 'Número do cartão',
                    labelStyle: TextStyle(color: Colors.black),
                    contentPadding: EdgeInsets.fromLTRB(12.0, 14.0, 12.0, 12.0),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 350,
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 220,
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        controller: _dateController,
                        decoration: const InputDecoration(
                          prefixIcon:
                              Icon(Icons.calendar_month, color: Colors.black),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelText: 'Data de Expiração',
                          labelStyle: TextStyle(color: Colors.black),
                          contentPadding:
                              EdgeInsets.fromLTRB(12.0, 14.0, 12.0, 12.0),
                        ),
                        cursorColor: Colors.black,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      height: 50,
                      width: 110,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _codeController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelText: 'Código',
                          labelStyle: TextStyle(color: Colors.black),
                          contentPadding:
                              EdgeInsets.fromLTRB(12.0, 14.0, 2.0, 12.0),
                        ),
                        cursorColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
              SizedBox(
                height: 50,
                width: 370,
                child: ElevatedButton(
                  onPressed: _saveCardDetails,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    fixedSize: const Size.fromHeight(18),
                  ),
                  child: const Text(
                    'Adicionar',
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
}
