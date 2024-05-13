// ignore_for_file: avoid_print, unused_field, use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kipiteu_app/screens/sign/otp_screen.dart';

import 'package:kipiteu_app/screens/sign/sign_in_screen.dart';
import 'package:kipiteu_app/services/google_services/google_sign_in_service/google_sign_in_service.dart';
import 'package:kipiteu_app/services/otp_services.dart/send_otp_service.dart';
import 'package:kipiteu_app/services/sign_up_services/sign_up_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;
  final bool _isPasswordStillVisible = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(constraints.maxWidth * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Registrar',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Crie uma conta para acessar a receitas saudáveis, aumento de peso, redução e manutenção do peso, controle de gordura e muito mais...',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),

                      labelText: 'Nome',
                      labelStyle: TextStyle(color: Colors.black),
                      contentPadding: EdgeInsets.fromLTRB(12.0, 20.0, 12.0,
                          12.0), // Ajuste o preenchimento interno aqui
                    ),
                    cursorColor: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    keyboardType: TextInputType.name,
                    controller: nicknameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),

                      labelText: 'Sobrenome',
                      labelStyle: TextStyle(color: Colors.black),
                      contentPadding: EdgeInsets.fromLTRB(12.0, 20.0, 12.0,
                          12.0), // Ajuste o preenchimento interno aqui
                    ),
                    cursorColor: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),

                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black),
                      contentPadding: EdgeInsets.fromLTRB(12.0, 20.0, 12.0,
                          12.0), // Ajuste o preenchimento interno aqui
                    ),
                    cursorColor: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Senha',
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
                  const SizedBox(height: 12),
                  TextField(
                    controller: confirmPasswordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Confirmar senha',
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
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await SignUpAPIService.signUp(
                          fullname: nameController.text,
                          nickname: nicknameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        sendOTPService(emailController.text);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const OTPScreen(),
                          ),
                        );
                      } catch (error) {
                        // Lidar com qualquer erro que ocorra durante o registro
                        print('Erro durante o registro: $error');
                        // Você pode exibir uma mensagem de erro para o usuário, se desejar
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(31.0),
                      ),
                      fixedSize: const Size.fromHeight(48),
                    ),
                    child: const Text(
                      'Registrar',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      /* GoogleSignInAPIService(); */
                      try {
                        await GoogleSignInAPIService();
                      } catch (error) {
                        print('Erro durante o login com o Google: $error');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(31.0),
                      ),
                    ),
                    child: const Text(
                      'Continuar com Google',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Já tens uma conta? ',
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Entrar',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.redAccent,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const SignInScreen(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
