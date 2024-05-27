// ignore_for_file: non_constant_identifier_names, avoid_print, use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:kipiteu_app/screens/home/home_screen.dart';
import 'package:kipiteu_app/screens/sign/verify_account_screen.dart';
import 'package:kipiteu_app/services/email_services/email_sign_in_service/email_sign_in_to_backend.dart';

Future<EmailLoginResponse?> EmailSignInAPIService(
    String email, String password, BuildContext context) async {
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

    if (response.statusCode == 200) {
      // Converte a resposta em um mapa JSON
      Map<String, dynamic> responseData = jsonDecode(response.body);

      // Verifica se a resposta contém a chave 'token'
      if (responseData.containsKey('token')) {
        String token = responseData['token'];
        String email =
            responseData['data']['Email']; // Obtém o e-mail da chave 'data'
        String fullname = responseData['data']['Fullname'];

        // Salva o token usando shared_preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        print('Token: $token');
        print('Email: $email');
        print('Nome: $fullname');

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
        return EmailLoginResponse(
            token: token, email: email, fullname: fullname);
      } else {
        print('Token não encontrado na resposta da API');
        return null;
      }
    } else if (response.statusCode == 403) {
      print('Erro ao fazer login: conta não verificada!');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const VerifyAccountScreen()),
      );
    } else {
      print('Erro ao fazer login: ${response.statusCode}');
      return null;
    }
  } catch (error) {
    print('Erro ao fazer login: $error');
    return null;
  }
  return null;
}
