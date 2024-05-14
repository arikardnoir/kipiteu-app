// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:kipiteu_app/screens/password/reset_password_screen.dart';

Future<void> forgotPasswordService(String email, BuildContext context) async {
  const url = 'https://kipiteu.onrender.com/auth/forgotpassword';

  try {
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({'email': email}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('OTP enviado com sucesso para $email');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
      );
    } else {
      print('Erro ao enviar OTP para $email: ${response.body}');
      throw Exception('Erro ao enviar OTP');
    }
  } catch (error) {
    print('Erro ao enviar OTP: $error');
    throw Exception('Erro ao enviar OTP');
  }
}
