import 'package:flutter/material.dart';

class PerfilPhotoScreen extends StatefulWidget {
  const PerfilPhotoScreen({super.key});

  @override
  State<PerfilPhotoScreen> createState() => _PerfilPhotoScreenState();
}

class _PerfilPhotoScreenState extends State<PerfilPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            const Text(
              'Foto do usuário',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(
              width: 120,
            ),
            IconButton(
              color: Colors.black,
              icon: const Icon(Icons.edit),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Foto do usuario',
                      style: TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Colors.grey,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
