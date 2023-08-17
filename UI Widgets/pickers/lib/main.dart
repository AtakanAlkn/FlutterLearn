import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  File? _image;
  String _name = "Atakan Alkan";
  int _age = 22;
  Color _backgroundColor = Colors.white;
  String _fontName = "Roboto"; // Default font
  double _fontSize = 24; // Default font size

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      // Yas Hesapla
      DateTime now = DateTime.now();
      int age = now.year - picked.year;
      if (now.month < picked.month ||
          (now.month == picked.month && now.day < picked.day)) {
        age--;
      }

      setState(() {
        _age = age;
      });
    }
  }

  void _openColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Renk Seç'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _backgroundColor,
              onColorChanged: (Color color) {
                setState(() {
                  _backgroundColor = color;
                });
              },
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tamam'),
            ),
          ],
        );
      },
    );
  }

  void _openFontPicker() async {
    String? font = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Font Seç'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _buildFontOption(FontAwesomeIcons.font, 'Roboto'),
                _buildFontOption(FontAwesomeIcons.font, 'Lato'),
                _buildFontOption(FontAwesomeIcons.font, 'Oswald'),
              ],
            ),
          ),
        );
      },
    );

    if (font != null && font.isNotEmpty) {
      setState(() {
        _fontName = font;
      });
    }
  }

  Widget _buildFontOption(IconData icon, String fontName) {
    return ListTile(
      leading: FaIcon(icon),
      title: Text(fontName),
      onTap: () {
        Navigator.pop(context, fontName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? const CircleAvatar(
                    radius: 60,
                    child: Icon(
                      Icons.person,
                      size: 60,
                    ),
                  )
                : CircleAvatar(
                    radius: 60,
                    backgroundImage: FileImage(_image!),
                  ),
            const SizedBox(height: 20),
            Text(
              _name,
              style: GoogleFonts.getFont(
                _fontName,
                fontSize: _fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$_age',
              style: GoogleFonts.getFont(
                _fontName,
                fontSize: _fontSize - 6,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Image Picker'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectDate,
              child: const Text('Date Picker'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openColorPicker,
              child: const Text('Color Picker'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openFontPicker,
              child: const Text('Font Picker'),
            ),
          ],
        ),
      ),
      backgroundColor: _backgroundColor,
    );
  }
}
