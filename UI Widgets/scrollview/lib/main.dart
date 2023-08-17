import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scroll View',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> labels = [
    'Tony Stark',
    'I am Iron Man',
    'Robert Downey Jr.',
    'Super Hero',
    'Jarvis',
    'Arc Reactor',
    'Marvel',
    'Best of the World',
  ];

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll View'),
        centerTitle: true,
      ),
      body: NotificationListener<ScrollEndNotification>(
        onNotification: (notification) {
          // Scroll işlemi bittiğinde
          if (notification.metrics.atEdge) {
            if (notification.metrics.pixels == 0) {
              // Listenin başı
            } else {
              // Listenin sonu
              _showEndOfListAlert(context);
            }
          }
          return true;
        },
        child: ListView.builder(
          itemCount: labels.length,
          itemBuilder: (context, index) => Card(
            child: SizedBox(
              height: deviceHeight / 5,
              child: Center(
                child: Text(
                  labels[index],
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showEndOfListAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('End of List'),
        content: const Text('You have reached the end of the scroll view!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
