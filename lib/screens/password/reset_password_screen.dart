// ignore_for_file: library_private_types_in_public_api, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kipiteu_app/screens/sign/sign_in_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();

  bool _isPasswordVisible = false;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(constraints.maxWidth * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40.0),
                  const Text(
                    'Confirme o seu email',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 30.0),
                  const Text(
                    'Digite corretamente o código que enviamos no seu email para consolidar o seu login',
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 60.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _textFieldOTP(
                          controller: _controller1, first: true, last: false),
                      _textFieldOTP(
                          controller: _controller2, first: false, last: false),
                      _textFieldOTP(
                          controller: _controller3, first: false, last: false),
                      _textFieldOTP(
                          controller: _controller4, first: false, last: false),
                      _textFieldOTP(
                          controller: _controller5, first: false, last: false),
                      _textFieldOTP(
                          controller: _controller6, first: false, last: true),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Nova senha',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                    cursorColor: Colors.black,
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: _passwordConfirmController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Confirmar nova senha',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                    cursorColor: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      String code = _controller1.text +
                          _controller2.text +
                          _controller3.text +
                          _controller4.text +
                          _controller5.text +
                          _controller6.text;
                      _verifyOTPService(_passwordController.text,
                          _passwordConfirmController.text, context);
                      print(code);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(31.0),
                      ),
                      fixedSize: const Size.fromHeight(48),
                    ),
                    child: const Text(
                      'Confirmar',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Enviar de novo',
                      style: TextStyle(fontSize: 13.0, color: Colors.black),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _textFieldOTP(
      {required TextEditingController controller,
      required bool first,
      bool? last}) {
    return SizedBox(
      height: 80,
      child: AspectRatio(
        aspectRatio: 0.6,
        child: TextField(
          controller: controller,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 1 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
              counter: const Offstage(),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.black26),
                borderRadius: BorderRadius.circular(14),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 2, color: Colors.redAccent),
                  borderRadius: BorderRadius.circular(14))),
        ),
      ),
    );
  }

  Future<void> _verifyOTPService(
      String password, String passwordConfirm, BuildContext context) async {
    const url = 'https://kipiteu.onrender.com/auth/resetpassword';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(
            {'password': password, 'passwordConfirm': passwordConfirm}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('OTP verificado com sucesso!');

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignInScreen()),
        );
      } else {
        print('Erro ao verificar OTP: ${response.body}');
        throw Exception('Erro ao verificar OTP');
      }
    } catch (error) {
      print('Erro ao verificar OTP: $error');
      throw Exception('Erro ao verificar OTP');
    }
  }
}
