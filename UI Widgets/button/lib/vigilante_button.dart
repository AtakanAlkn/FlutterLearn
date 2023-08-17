import 'package:flutter/material.dart';

class VigilanteButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const VigilanteButton(
      {super.key, required this.onPressed, required this.buttonText});

  @override
  // ignore: library_private_types_in_public_api
  _VigilanteButtonState createState() => _VigilanteButtonState();
}

class _VigilanteButtonState extends State<VigilanteButton> {
  bool _isButtonTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        setState(() {
          _isButtonTapped = true;
        });
      },
      onTapUp: (TapUpDetails details) {
        setState(() {
          _isButtonTapped = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isButtonTapped = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _isButtonTapped ? Colors.yellow : Colors.purple,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Text(
          widget.buttonText,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
