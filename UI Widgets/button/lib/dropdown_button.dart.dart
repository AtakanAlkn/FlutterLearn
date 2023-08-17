import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? _selectedOption; // Değişken tipini String? olarak değiştirin

  void _showPopup(String? option) {
    // Değişken tipini String? olarak değiştirin
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selected Option'),
          content: Text(
              'You selected: ${option ?? "None"}'), // Option değeri null olabileceğinden ?? işareti ile kontrol ediyoruz
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedOption,
      hint: const Text('Select an option'),
      onChanged: (newValue) {
        setState(() {
          _selectedOption = newValue;
          _showPopup(newValue);
        });
      },
      items: const [
        DropdownMenuItem(
          value: "Option 1",
          child: Text("Option 1"),
        ),
        DropdownMenuItem(
          value: "Option 2",
          child: Text("Option 2"),
        ),
        DropdownMenuItem(
          value: "Option 3",
          child: Text("Option 3"),
        ),
      ],
    );
  }
}
