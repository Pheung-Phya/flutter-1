import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black12,
            title: const Text(
              'Imagepicker',
            ),
            centerTitle: true,
          ),
          body: const HomeScreen()),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _seletedImage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          MaterialButton(
            onPressed: () {
              _pickImageFromGallery();
            },
            color: Colors.blue,
            child: const Text("Pick image from Gallery"),
          ),
          const SizedBox(
            height: 12,
          ),
          MaterialButton(
            color: Colors.green,
            onPressed: () {
              _pickImageFromCamera();
            },
            child: const Text("Pick image from Camera"),
          ),
          const SizedBox(
            height: 17,
          ),
          MaterialButton(
            color: Colors.green,
            onPressed: () {
              setState(() {
                _seletedImage = null;
              });
            },
            child: const Text("Take Image back"),
          ),
          _seletedImage != null
              ? Image.file(_seletedImage!)
              : const Text("Please selected an image"),
        ],
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _seletedImage = File(returnImage!.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) {
      return;
    }
    setState(() {
      _seletedImage = File(returnImage.path);
    });
  }
}
