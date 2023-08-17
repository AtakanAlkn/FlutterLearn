import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:
            _isSwitched ? Colors.green : const Color.fromARGB(255, 253, 0, 0),
        appBar: AppBar(
            title: const Center(
          child: Text('View Model Color Wizard'),
        )),
        body: Center(
          child: MySwitch(
            isSwitched: _isSwitched,
            onChanged: (value) {
              setState(() {
                _isSwitched = value;
              });
            },
          ),
        ),
      ),
    );
  }
}

class MySwitch extends StatelessWidget {
  final bool isSwitched;
  final ValueChanged<bool> onChanged;

  const MySwitch(
      {super.key, required this.isSwitched, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Switch(
          value: isSwitched,
          onChanged: onChanged,
          activeTrackColor: const Color.fromARGB(255, 253, 0, 0),
          inactiveTrackColor: const Color.fromARGB(255, 12, 246, 0),
          thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.black;
            }
            return Colors.black;
          }),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
