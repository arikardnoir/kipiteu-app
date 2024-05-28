// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PerfilPhotoScreen extends StatefulWidget {
  const PerfilPhotoScreen({super.key});

  @override
  State<PerfilPhotoScreen> createState() => _PerfilPhotoScreenState();
}

class _PerfilPhotoScreenState extends State<PerfilPhotoScreen> {
  String? _imagePath;

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
                showModalBottomSheet<void>(
                  backgroundColor: Colors.grey,
                  barrierLabel: 'Foto o usuario',
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              const Text(
                                'Foto do usuario',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              const SizedBox(
                                width: 80,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Card(
                                  color: Colors.grey,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        50), // Circular shape
                                    side: const BorderSide(
                                        color: Colors.red,
                                        width: 2), // Red border
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      _pickImage(ImageSource.camera);
                                    },
                                    icon: const Icon(Icons.camera),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Card(
                                  color: Colors.grey,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        50), // Circular shape
                                    side: const BorderSide(
                                        color: Colors.red,
                                        width: 2), // Red border
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      _pickImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.photo_library),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          if (_imagePath != null)
            Positioned.fill(
              child: Image.file(
                File(_imagePath!),
                fit: BoxFit.contain,
              ),
            ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      setState(() {
        _imagePath = image.path;
        print('Image path: $_imagePath'); // Debug print
      });
    } else {
      print('No image selected.'); // Debug print
    }
  }
}
