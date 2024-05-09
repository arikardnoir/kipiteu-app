// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginResponse {
  final String? token;
  final String? email;
  final String? fullname;

  LoginResponse({this.token, this.email, this.fullname});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      email: json['data']['Email'],
      fullname: json['data']['Fullname'],
    );
  }
}

Future<LoginResponse?> sendSignInDataToBackend(
  String email,
  String fullname,
  String type,
  String google_id,
  String google_verification_code,
) async {
  String backendUrl = 'https://kipiteu.onrender.com/login';

  try {
    Map<String, dynamic> signInData = {
      'email': email,
      'fullname': fullname,
      'type': type,
      'google_id': google_id,
      'google_verification_code': google_verification_code,
    };

    final response = await http.post(
      Uri.parse(backendUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(signInData),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      return LoginResponse.fromJson(responseData);
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
