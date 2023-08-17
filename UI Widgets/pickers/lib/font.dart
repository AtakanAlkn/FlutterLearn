import 'package:flutter/material.dart';
import 'package:flutter_font_picker/flutter_font_picker.dart';

class FontPage extends StatefulWidget {
  const FontPage({Key? key}) : super(key: key);

  @override
  State<FontPage> createState() => _FontPageState();
}

class _FontPageState extends State<FontPage> {
  String selectedFontFamily = 'Open Sans'; // Default font family

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange),
            ),
            onPressed: () async {
              final PickerFont? pickedFont = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FontPicker(
                    onFontChanged: (PickerFont font) {
                      setState(() {
                        selectedFontFamily = font.fontFamily;
                      });
                    },
                  ),
                ),
              );

              // If no font is selected or the user presses the back button, use the default font.
              if (pickedFont == null) {
                setState(() {
                  selectedFontFamily = 'Open Sans';
                });
              }
            },
            child: Text('Pick a Font'),
          ),
          const SizedBox(height: 20),
          Text(
            'Atakan',
            style: TextStyle(
              fontSize: 20,
              fontFamily: selectedFontFamily, // Set the selected font family
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
