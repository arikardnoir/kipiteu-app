// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

class EmailLoginResponse {
  final String? token;
  final String? email;
  final String? fullname;

  EmailLoginResponse({this.token, this.email, this.fullname});

  factory EmailLoginResponse.fromJson(Map<String, dynamic> json) {
    return EmailLoginResponse(
      token: json['token'],
      email: json['data']['Email'],
      fullname: json['data']['Fullname'],
    );
  }
}

Future<EmailLoginResponse?> sendEmailSignInDataToBackend(
  String email,
  String password,
  String type,
) async {
  String backendUrl = 'https://kipiteu.onrender.com/login';

  try {
    Map<String, dynamic> emailSignInData = {
      'email': email,
      'password': password,
      'type': type,
    };

    final response = await http.post(
      Uri.parse(backendUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(emailSignInData),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      return EmailLoginResponse.fromJson(responseData);
    } else {
      print(
          'Erro ao enviar dados da conta para o backend. Código de status: ${response.statusCode}');
      return null;
    }
  } catch (error) {
    print('Erro ao enviar dados da conta para o backend: $error');
    return null;
  }
}
