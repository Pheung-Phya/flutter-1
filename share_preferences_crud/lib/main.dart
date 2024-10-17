import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      home: MyImageStorageApp(),
    );
  }
}

// class SharedPreferencesCRUD extends StatefulWidget {
//   const SharedPreferencesCRUD({super.key});
//   @override
//   // ignore: library_private_types_in_public_api
//   _SharedPreferencesCRUDState createState() => _SharedPreferencesCRUDState();
// }

// class _SharedPreferencesCRUDState extends State<SharedPreferencesCRUD> {
//   String storedData = "";

//   // Create and Read
//   Future<void> _saveData(String value) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('dataKey', value); // Save data
//     setState(() {
//       storedData = value; // Update UI
//     });
//   }

//   Future<void> _readData() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       storedData = prefs.getString('dataKey') ?? "No Data Found";
//     });
//   }

//   // Update
//   Future<void> _updateData(String value) async {
//     await _saveData(value); // Overwrite the existing data
//   }

//   // Delete
//   Future<void> _deleteData() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('dataKey');
//     setState(() {
//       storedData = "Data Deleted";
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('SharedPreferences CRUD')),
//       body: Center(
//         child: Column(
//           children: [
//             Text("Stored Data: $storedData"),
//             ElevatedButton(
//                 onPressed: () => _saveData('New Data'),
//                 child: const Text('Save Data')),
//             ElevatedButton(onPressed: _readData, child:const Text('Read Data')),
//             ElevatedButton(
//                 onPressed: () => _updateData('Updated Data'),
//                 child:const Text('Update Data')),
//             ElevatedButton(onPressed: _deleteData, child:const Text('Delete Data')),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MyImageStorageApp extends StatefulWidget {
  const MyImageStorageApp({super.key});
  @override
  _MyImageStorageAppState createState() => _MyImageStorageAppState();
}

class _MyImageStorageAppState extends State<MyImageStorageApp> {
  File? _image;
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final Directory directory = await getApplicationDocumentsDirectory();
      final String path = directory.path;

      // Create the file in local storage
      final File localImage = File('$path/${image.name}');
      final File savedImage = await File(image.path).copy(localImage.path);

      // Save image path to shared preferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('imagePath', savedImage.path);

      setState(() {
        _image = savedImage;
      });
    }
  }

  Future<void> _loadImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _imagePath = prefs.getString('imagePath');

    if (_imagePath != null) {
      setState(() {
        _image = File(_imagePath!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Image Locally'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image != null
                ? Image.file(_image!)
                : const Text('No image selected.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick and Store Image'),
            ),
          ],
        ),
      ),
    );
  }
}
