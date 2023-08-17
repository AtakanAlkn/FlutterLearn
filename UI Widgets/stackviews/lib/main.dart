import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harry Potter',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> spells = [
    'Alohomora',
    'Avada Kedavra',
    'Expelliarmus',
    'Lumos',
    'Accio',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harry Potter'),
        centerTitle: true,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 4),
          itemCount: spells.length,
          itemBuilder: (context, index) => Card(
            child: Center(
              child: Text(
                spells[index],
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
