// ignore_for_file: avoid_print, unused_element

/* import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> verifyOTPService(String otp) async {
  const url = 'https://kipiteu.onrender.com/users/verify';

  try {
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({'otp': otp}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('OTP verificado com sucesso!');
      // Aqui você pode lidar com a resposta, se necessário
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