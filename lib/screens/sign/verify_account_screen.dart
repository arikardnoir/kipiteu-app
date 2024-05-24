// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:kipiteu_app/screens/sign/otp_screen.dart';
import 'package:kipiteu_app/services/otp_services.dart/verify_account_service.dart';

class VerifyAccountScreen extends StatefulWidget {
  const VerifyAccountScreen({super.key});

  @override
  _VerifyAccountScreenState createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(constraints.maxWidth * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 70.0,
                  ),
                  const Text(
                    'Verifique a sua conta!',
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Vamos resolver isso para que voltes a usar KiPiteu de forma tranquila',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelStyle: TextStyle(color: Colors.black),
                      contentPadding:
                          EdgeInsets.fromLTRB(12.0, 14.0, 12.0, 12.0),
                    ),
                    cursorColor: Colors.black,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      verrifyAccountService(_emailController.text);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const OTPScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(31.0),
                      ),
                      fixedSize: const Size.fromHeight(48),
                    ),
                    child: const Text(
                      'Reenviar OTP',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
