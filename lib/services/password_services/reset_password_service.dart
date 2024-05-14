// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> resetPasswordService(
    String otp, String password, String confirmPassword) async {
  const url = 'https://kipiteu.onrender.com/users/verify';

  try {
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'otp': otp,
        'password': password,
        'confirmPassword': confirmPassword
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('OTP enviado com sucesso');
    } else {
      print('Erro ao enviar OTP: ${response.body}');
      throw Exception('Erro ao enviar OTP');
    }
  } catch (error) {
    print('Erro ao enviar OTP: $error');
    throw Exception('Erro ao enviar OTP');
  }
}
