/* // ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> resetPasswordService(
    String otp, String password, String confirmPassword) async {
  const url = 'https://kipiteu.onrender.com/auth/resetpassword/';

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
      print('Passord modificada com sucesso');
    } else {
      print('Erro ao modificar password: ${response.body}');
      throw Exception('Erro ao modificar password');
    }
  } catch (error) {
    print('Erro ao modificar password: $error');
    throw Exception('Erro ao modificar password');
  }
}
 */