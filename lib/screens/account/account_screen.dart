// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kipiteu_app/screens/sign/sign_in_screen.dart';
import 'package:kipiteu_app/screens/account/perfil_photo_screen.dart';
import 'package:kipiteu_app/screens/account/subscription_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String? _imagePath;
  String _nome = '';
  String _email = '';

  final TextEditingController _editNameController = TextEditingController();
  final TextEditingController _editEmailController = TextEditingController();

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SignInScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 0,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                color: Colors.white,
                icon: Image.asset(
                  'assets/icons/account_icons/ring.png',
                  width: 30,
                  height: 30,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: BottomWaveClipper(),
            child: Container(
              color: Colors.grey,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 60.0),
              child: Column(
                children: [
                  InkWell(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 80,
                      backgroundImage: _imagePath != null
                          ? FileImage(
                              File(_imagePath!),
                            )
                          : null,
                    ),
                    onTap: () async {
                      final selectedImagePath = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PerfilPhotoScreen()),
                      );

                      if (selectedImagePath != null) {
                        setState(() {
                          _imagePath = selectedImagePath;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text(
                                  'Editar Nome',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 300,
                                  child: TextField(
                                    controller: _editNameController,
                                    decoration: InputDecoration(
                                      hintText:
                                          _nome, // Usa o nome atual como hint
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cancelar'),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              _nome = _editNameController
                                                  .text; // Atualiza o nome atual
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Salvar'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      _nome,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 1),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text(
                                  'Editar email',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 300,
                                  child: TextField(
                                    controller: _editEmailController,
                                    decoration: InputDecoration(
                                      hintText: _email,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cancelar'),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              _email = _editEmailController
                                                  .text; // Atualiza o nome atual
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Salvar'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      _email, // Substitui 'Nikola Tesla' pelo nome atual
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'DEFINIÇOES DA CONTA',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward,
                  ),
                  leading: Image.asset(
                    'assets/icons/account_icons/payment.png',
                    width: 20,
                    height: 20,
                  ),
                  title: const Text(
                    'Planos',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SubscriptionScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward,
                  ),
                  leading: Image.asset(
                    'assets/icons/account_icons/payment.png',
                    width: 20,
                    height: 20,
                  ),
                  title: const Text(
                    'Formas pagamento',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    // Ação ao clicar em "Payment options"
                  },
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward,
                  ),
                  leading: Image.asset(
                    'assets/icons/account_icons/notify.png',
                    width: 20,
                    height: 20,
                  ),
                  title: const Text(
                    'Notificações',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    // Ação ao clicar em "Notification preferences"
                  },
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward,
                  ),
                  leading: Image.asset(
                    'assets/icons/account_icons/personal.png',
                    width: 20,
                    height: 20,
                  ),
                  title: const Text(
                    'Informações pessoais',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    // Ação ao clicar em "Personal information"
                  },
                ),
                //const Divider(),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'AJUDA E SUPORTE',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward,
                  ),
                  leading: Image.asset(
                    'assets/icons/account_icons/asks.png',
                    width: 20,
                    height: 20,
                  ),
                  title: const Text(
                    'Perguntas frequentes',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    // Ação ao clicar em "My dashboard"
                  },
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward,
                  ),
                  leading: Image.asset(
                    'assets/icons/account_icons/talk.png',
                    width: 20,
                    height: 20,
                  ),
                  title: const Text(
                    'Fale conosco',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                //const Divider(),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'SEGURANÇA',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward,
                  ),
                  leading: Image.asset(
                    'assets/icons/account_icons/legal.png',
                    width: 20,
                    height: 20,
                  ),
                  title: const Text(
                    'Assuntos legais',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    // Ação ao clicar em "My dashboard"
                  },
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward,
                  ),
                  leading: Image.asset(
                    'assets/icons/account_icons/safety.png',
                    width: 20,
                    height: 20,
                  ),
                  title: const Text(
                    'Dados e proteção',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/icons/account_icons/exit.png',
                    width: 20,
                    height: 20,
                  ),
                  title: const Text(
                    'Sair',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    _logout(context);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 30);
    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 60);
    var secondEndPoint = Offset(size.width, size.height - 20);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
