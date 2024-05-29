// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilPhotoScreen extends StatefulWidget {
  const PerfilPhotoScreen({super.key});

  @override
  State<PerfilPhotoScreen> createState() => _PerfilPhotoScreenState();
}

class _PerfilPhotoScreenState extends State<PerfilPhotoScreen> {
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? savedImagePath = prefs.getString('imagePath');
    setState(() {
      _imagePath = savedImagePath;
    });
  }

  Future<void> _saveImage(String imagePath) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('imagePath', imagePath);
  }

  Future<void> _deleteImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('imagePath');
    setState(() {
      _imagePath = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context, _imagePath); // Pass the image path back
          },
        ),
        title: const Text(
          'Foto do usuário',
          style: TextStyle(color: Colors.black),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showImagePicker(context);
        },
        child: const Icon(Icons.edit),
      ),
    );
  }

  Future<void> _showImagePicker(BuildContext context) async {
    showModalBottomSheet<void>(
      backgroundColor: Colors.white,
      barrierLabel: 'Foto o usuario',
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  'Foto do usuario',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
                IconButton(
                  onPressed: () {
                    _deleteImage();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ]),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(color: Colors.red, width: 2),
                      ),
                      child: IconButton(
                        onPressed: () {
                          _pickImage(ImageSource.camera);
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.camera),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(color: Colors.red, width: 2),
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
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      setState(() {
        _imagePath = image.path;
        print('Image path: $_imagePath');
        _saveImage(_imagePath!);
      });
    } else {
      print('No image selected.');
    }
  }
}
