import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Container',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        title: const Text('Container'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.teal, borderRadius: BorderRadius.circular(0)),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 5, color: Colors.black)),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                height: deviceHeight / 5,
                width: deviceWidth / 3,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(width: 2, color: Colors.blue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
