import 'package:button/shake_button.dart';
import 'package:button/blacksmith_button.dart';
import 'package:button/saloon_button.dart';
import 'package:button/vigilante_button.dart';
import 'package:flutter/material.dart';
import 'dropdown_button.dart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void _onButtonPressed() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Center(
          child: Text('Buttons'),
        )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomDropdownButton(),
              const SizedBox(height: 20),
              SaloonButton(
                buttonText: 'Tap Me',
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              VigilanteButton(
                onPressed: _onButtonPressed,
                buttonText: 'Change Color',
              ),
              const SizedBox(
                height: 20,
              ),
              BlacksmithButton(),
              const SizedBox(
                height: 20,
              ),
              ShakeButton(),
            ],
          ),
        ),
      ),
    );
  }
}
