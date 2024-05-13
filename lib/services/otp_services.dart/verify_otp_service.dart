/* // ignore_for_file: avoid_print, unused_element, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:kipiteu_app/screens/sign/sign_in_screen.dart';

Future<void> _verifyOTPService(String code, BuildContext context) async {
  const url = 'https://kipiteu.onrender.com/users/verify';

  try {
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({'code': code}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('OTP verificado com sucesso!');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    } else {
      print('Erro ao verificar OTP: ${response.body}');
      throw Exception('Erro ao verificar OTP');
    }
  } catch (error) {
    print('Erro ao verificar OTP: $error');
    throw Exception('Erro ao verificar OTP');
  }
}
 */