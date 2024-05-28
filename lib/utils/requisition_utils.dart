// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

Future<void> performApiRequest(
  BuildContext context,
  Future<void> Function() apiRequest,
  Widget Function() destinationScreenBuilder,
) async {
  // Mostra o indicador de carregamento
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  try {
    // Executa a requisição à API
    await apiRequest();
    // Se a requisição for bem-sucedida, feche o diálogo e navegue para a próxima tela
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => destinationScreenBuilder(),
      ),
    );
  } catch (error) {
    // Se houver um erro, feche o diálogo e mostre uma mensagem de erro
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro'),
          content: Text('Erro ao fazer a requisição: $error'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
