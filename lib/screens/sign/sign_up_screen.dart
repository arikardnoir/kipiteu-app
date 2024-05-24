// ignore_for_file: avoid_print, unused_field, use_build_context_synchronously

import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:kipiteu_app/screens/initial/initial_screen.dart';
import 'package:kipiteu_app/screens/sign/otp_screen.dart';

import 'package:kipiteu_app/screens/sign/sign_in_screen.dart';
import 'package:kipiteu_app/services/google_services/google_sign_in_service/google_sign_in_service.dart';
import 'package:kipiteu_app/services/otp_services.dart/send_otp_service.dart';
import 'package:kipiteu_app/services/sign_up_services/sign_up_service.dart';
import 'package:kipiteu_app/validations/validations_mixin.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with ValidationsMixin {
  bool _isPasswordVisible = false;
  bool _isPasswordStillVisible = false;

  String nicknamErrorMessage = '';
  String cpfErrorMessage = '';
  String emailErrorMessage = '';
  String passwordErrorMessage = '';
  String passwordConfirmErrorMessage = '';

  bool isValid = true;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Ícone de voltar
          onPressed: () {
            Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (context) => const InitialScreen(),
              ),
            );
          },
        ),
      ),
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

                      labelText: 'Nome completo',
                      labelStyle: TextStyle(color: Colors.black),
                      contentPadding: EdgeInsets.fromLTRB(12.0, 14.0, 12.0,
                          12.0), // Ajuste o preenchimento interno aqui
                    ),
                    cursorColor: Colors.black,
                  ),
                  const SizedBox(height: 12),

                  TextField(
                    keyboardType: TextInputType.name,
                    controller: nicknameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: nicknamErrorMessage.isNotEmpty
                              ? Colors.red
                              : Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: nicknamErrorMessage.isNotEmpty
                              ? Colors.redAccent
                              : Colors.black,
                        ),
                      ),
                      labelText: 'Nome de usuário',
                      labelStyle: TextStyle(
                          color: nicknamErrorMessage.isNotEmpty
                              ? Colors.redAccent
                              : Colors.black),
                      contentPadding:
                          const EdgeInsets.fromLTRB(12.0, 14.0, 12.0, 12.0),
                      suffixIcon: isLowerCase(nicknameController.text) &&
                              nicknameController.text.isNotEmpty
                          ? const Icon(Icons.verified_sharp,
                              color: Colors.green)
                          : null,
                    ),
                    style: TextStyle(
                        color: nicknamErrorMessage.isNotEmpty
                            ? Colors.red
                            : Colors.black),
                    cursorColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        nicknamErrorMessage = !isLowerCase(value)
                            ? 'Apenas letras minúsculas são permitidas!'
                            : '';
                      });
                    },
                  ),
                  const SizedBox(
                      height:
                          8), // Espaçamento entre o TextField e a mensagem de erro
                  nicknamErrorMessage.isNotEmpty
                      ? Text(
                          nicknamErrorMessage,
                          style: const TextStyle(color: Colors.redAccent),
                        )
                      : const SizedBox(), // Mostra a mensagem de erro se houver, caso contrário, um SizedBox

                  const SizedBox(height: 10),

                  TextField(
                    keyboardType: TextInputType.number,
                    controller: cpfController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'CPF',
                      labelStyle: const TextStyle(color: Colors.black),
                      contentPadding:
                          const EdgeInsets.fromLTRB(12.0, 14.0, 12.0, 12.0),
                      suffixIcon: CPFValidator.isValid(cpfController.text)
                          ? const Icon(Icons.verified_sharp,
                              color: Colors.green)
                          : null,
                    ),
                    cursorColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        if (CPFValidator.isValid(value)) {
                          cpfErrorMessage = '';
                        } else {
                          cpfErrorMessage = 'CPF inválido';
                        }
                      });
                    },
                  ),
                  const SizedBox(
                      height:
                          8), // Espaçamento entre o TextField e a mensagem de erro
                  cpfErrorMessage.isNotEmpty
                      ? Text(
                          cpfErrorMessage,
                          style: const TextStyle(color: Colors.red),
                        )
                      : const SizedBox(), // Mostra a mensagem de erro se houver, caso contrário, um SizedBox

                  const SizedBox(height: 10),

                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Colors.black),
                      contentPadding:
                          const EdgeInsets.fromLTRB(12.0, 14.0, 12.0, 12.0),
                      suffixIcon: EmailValidator.validate(emailController.text)
                          ? const Icon(Icons.verified_sharp,
                              color: Colors.green)
                          : null,
                    ),
                    cursorColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        isValid = EmailValidator.validate(value);
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  isValid
                      ? const SizedBox()
                      : const Text(
                          'Email inválido',
                          style: TextStyle(color: Colors.red),
                        ),
                  const SizedBox(height: 10),

                  TextField(
                    controller: passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelStyle: const TextStyle(color: Colors.black),
                      contentPadding:
                          const EdgeInsets.fromLTRB(12.0, 14.0, 12.0, 12.0),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isPasswordValid(passwordController.text))
                            const Icon(Icons.verified, color: Colors.green),
                          IconButton(
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
                        ],
                      ),
                    ),
                    cursorColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        passwordErrorMessage = !isPasswordValid(value)
                            ? 'Não são permitidos menos de 6 caracteres!'
                            : '';
                      });
                    },
                  ),

                  const SizedBox(height: 8),
                  passwordErrorMessage.isNotEmpty
                      ? Text(
                          passwordErrorMessage,
                          style: const TextStyle(color: Colors.redAccent),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 12),
                  TextField(
                    controller: confirmPasswordController,
                    obscureText: !_isPasswordStillVisible,
                    decoration: InputDecoration(
                      labelText: 'Confirmar senha',
                      border: const OutlineInputBorder(),
                      /* suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordStillVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordStillVisible = !_isPasswordStillVisible;
                          });
                        },
                      ), */
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelStyle: const TextStyle(color: Colors.black),
                      contentPadding:
                          const EdgeInsets.fromLTRB(12.0, 14.0, 12.0, 12.0),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isPasswordValid(confirmPasswordController.text))
                            const Icon(Icons.verified, color: Colors.green),
                          IconButton(
                            icon: Icon(
                              _isPasswordStillVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordStillVisible =
                                    !_isPasswordStillVisible;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    cursorColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        passwordConfirmErrorMessage = !isPasswordValid(value)
                            ? 'As senhas não coincidem!'
                            : '';
                      });
                    },
                  ),
                  const SizedBox(
                      height:
                          8), // Espaçamento entre o TextField e a mensagem de erro
                  passwordConfirmErrorMessage.isNotEmpty
                      ? Text(
                          passwordConfirmErrorMessage,
                          style: const TextStyle(color: Colors.redAccent),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await SignUpAPIService.signUp(
                          fullname: nameController.text,
                          nickname: nicknameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          cpf: cpfController.text,
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
