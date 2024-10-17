import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ImageSQLite(),
    );
  }
}
// For manipulating file paths

class ImageSQLite extends StatefulWidget {
  @override
  _ImageSQLiteState createState() => _ImageSQLiteState();
}

class _ImageSQLiteState extends State<ImageSQLite> {
  Database? _database;
  File? _image;
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  // Initialize the SQLite database
  Future<void> _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'images.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE images(id INTEGER PRIMARY KEY, imagePath TEXT)",
        );
      },
      version: 1,
    );       
    _loadImageFromDatabase();
  }

  // Pick an image from the gallery and save its path to SQLite
  Future<void> _pickAndSaveImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      // Save image to local storage and store the file path in SQLite
      await _saveImageToDB(_image!);
    }
  }

  // Save the image to local storage and store the path in SQLite
  Future<void> _saveImageToDB(File image) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final fileName = basename(image.path);
      final savedImage = await image.copy('${directory.path}/$fileName');

      await _database?.insert(
        'images',
        {'imagePath': savedImage.path},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('Error saving image: $e');
    }
  }

  // Load image path from SQLite and display it
  Future<void> _loadImageFromDatabase() async {
    final List<Map<String, dynamic>> images =
        await _database?.query('images') ?? [];

    if (images.isNotEmpty) {
      final imagePath = images.last['imagePath'];
      final imageFile = File(imagePath);

      if (await imageFile.exists()) {
        setState(() {
          _image = imageFile;
        });
      } else {
        print('Image file does not exist at the path: $imagePath');
      }
    }
  }

  // Delete the image from the database and local storage
  Future<void> _deleteImage() async {
    await _database?.delete('images'); // Delete all records
    setState(() {
      _image = null;
      _imagePath = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SQLite Image Storage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null ? Image.file(_image!) : Text('No image selected.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickAndSaveImage,
              child: Text('Pick and Save Image'),
            ),
            ElevatedButton(
              onPressed: _deleteImage,
              child: Text('Delete Image'),
            ),
          ],
        ),
      ),
    );
  }
}
