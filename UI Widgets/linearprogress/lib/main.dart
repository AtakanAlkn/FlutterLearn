import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int _progressValue = 0;
  final int _maxProgressValue = 10;

  void _updateProgress() {
    setState(() {
      _progressValue = (_progressValue + 1) % (_maxProgressValue + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Linear Progress'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LinearProgressIndicator(
                value: _progressValue / _maxProgressValue,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                backgroundColor: Colors.black,
              ),
              const SizedBox(height: 20),
              Text(
                '$_progressValue / $_maxProgressValue',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateProgress,
                child: const Text('Progress'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
