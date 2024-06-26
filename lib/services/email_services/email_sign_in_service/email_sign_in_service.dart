// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kipiteu_app/services/email_services/email_sign_in_service/email_sign_in_to_backend.dart';

Future<EmailLoginResponse?> EmailSignInAPIService(
    String email, String password) async {
  try {
    String type = 'email';
    String apiUrl = 'https://kipiteu.onrender.com/login';

    // Faz a solicitação de login ao servidor
    http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(<String, String>{
        'email': email,
        'password': password,
        'type': type, // Adiciona o campo 'type' no corpo da requisição
      }),
    );
    //print('Resposta da API: ${response.body}');

    if (response.statusCode == 200) {
      // Converte a resposta em um mapa JSON
      Map<String, dynamic> responseData = jsonDecode(response.body);

      // Verifica se a resposta contém a chave 'token'
      if (responseData.containsKey('token')) {
        String token = responseData['token'];
        String email =
            responseData['data']['Email']; // Obtém o e-mail da chave 'data'
        String fullname = responseData['data']
            ['Fullname']; // Obtém o nome completo da chave 'data'

        print('Token: $token');
        print('Email: $email');
        print('Nome: $fullname');

        return EmailLoginResponse(
            token: token, email: email, fullname: fullname);
      } else {
        print('Token não encontrado na resposta da API');
        return null;
      }
    } else {
      print('Erro ao fazer login: ${response.statusCode}');
      return null;
    }
  } catch (error) {
    print('Erro ao fazer login: $error');
    return null;
  }
}
