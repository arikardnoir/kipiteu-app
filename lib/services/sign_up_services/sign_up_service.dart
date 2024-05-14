// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kipiteu_app/services/otp_services.dart/send_otp_service.dart';

class SignUpAPIService {
  SignUpAPIService(String fullname, String nickname, String email, String cpf,
      String password);

  static Future<void> signUp({
    required String fullname,
    required String nickname,
    required String cpf,
    required String email,
    required String password,
  }) async {
    const url = 'https://kipiteu.onrender.com/users';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'fullname': fullname,
          'nickname': nickname,
          'email': email,
          'cpf': cpf,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        print('Usuário cadastrado com sucesso');
        await sendOTPService(email); // Enviar OTP após o cadastro bem-sucedido
      } else {
        // Falha no cadastro do usuário
        // Exibir mensagem de erro ou fazer outra ação apropriada
        print('Falha ao cadastrar usuário: ${response.statusCode}');
        print('Erro: ${response.body}');
      }
    } catch (error) {
      // Lidar com erros de rede ou outras exceções
      print('Erro durante o cadastro do usuário: $error');
      // Exibir mensagem de erro ou fazer outra ação apropriada
    }
  }
}
