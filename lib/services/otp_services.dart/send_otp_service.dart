// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> sendOTPService(String email) async {
  const url = 'https://kipiteu.onrender.com/users/verify';

  try {
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({'email': email}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('OTP enviado com sucesso para $email');
    } else {
      print('Erro ao enviar OTP para $email: ${response.body}');
      throw Exception('Erro ao enviar OTP');
    }
  } catch (error) {
    print('Erro ao enviar OTP: $error');
    throw Exception('Erro ao enviar OTP');
  }
}
