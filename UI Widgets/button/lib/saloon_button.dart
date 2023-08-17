import 'package:flutter/material.dart';

class SaloonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const SaloonButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red, // Arka plan rengi kırmızı
        foregroundColor: Colors.yellow, // Yazı rengi sarı
        disabledForegroundColor:
            Colors.black, // Butona tıklanınca efekt rengi siyah
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Radius 10
          side: const BorderSide(color: Colors.blue, width: 2), // Border 2
        ),
        elevation: 5, // Gölge yüksekliği 5
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 20, // Font 20
        ),
      ),
    );
  }
}
