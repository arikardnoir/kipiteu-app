// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final String token;
  final String name;
  final String email;

  User({required this.token, required this.name, required this.email});
}

Future<User> EmailSignInAPIService(String email, String password) async {
  try {
    String apiUrl = 'https://kipiteu.onrender.com/login';

    http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      String responseBody = response.body;

      if (responseBody.isNotEmpty) {
        Map<String, dynamic> data = jsonDecode(responseBody);

        if (data.containsKey('token') &&
            data.containsKey('name') &&
            data.containsKey('email')) {
          String token = data['token'];
          String name = data['name'];
          String email = data['email'];

          print('Login bem-sucedido');

          return User(token: token, name: name, email: email);
        } else {
          throw const FormatException(
              'O JSON retornado não contém os campos necessários');
        }
      } else {
        throw const FormatException('A resposta do servidor está vazia');
      }
    } else if (response.statusCode == 204) {
      // Caso específico para resposta sem conteúdo (204 No Content)
      print('Login bem-sucedido, mas sem dados do usuário');
      return User(token: '', name: '', email: '');
    } else {
      print('Erro: Falha ao fazer login');
      throw Exception('Erro: Falha ao fazer login');
    }
  } catch (e) {
    print('Erro: $e');
    throw Exception('Erro: $e');
  }
}
