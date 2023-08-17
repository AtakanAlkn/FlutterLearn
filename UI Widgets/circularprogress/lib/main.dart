import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CircularProgressView(),
    );
  }
}

class CircularProgressView extends StatefulWidget {
  const CircularProgressView({super.key});

  @override
  State<CircularProgressView> createState() => _CircularViewState();
}

class _CircularViewState extends State<CircularProgressView> {
  int count = 0;
  bool countingInProgress = false;

  void _startCounting() {
    if (!countingInProgress) {
      setState(() {
        countingInProgress = true;
        count = 0;
      });

      for (int i = 1; i <= 100; i++) {
        Future.delayed(Duration(milliseconds: 100 * i), () {
          setState(() {
            count = i;
            if (i == 100) {
              countingInProgress = false;
            }
          });
        });
      }
    }
  }

  Color _getIndicatorColor() {
    int colorIndex = count ~/ 10;
    colorIndex = colorIndex.clamp(0, 9);

    List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      const Color.fromARGB(255, 0, 34, 51),
      Colors.indigo,
      Colors.purple,
      Colors.pink,
      Colors.brown,
      Colors.cyan,
    ];
    return colors[colorIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circular Progress'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (countingInProgress) // True ise göster
              CircularProgressIndicator(
                value: count / 100,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(_getIndicatorColor()),
              ),
            const SizedBox(height: 20),
            if (countingInProgress) //True ise
              Text(
                "Count: $count",
                style: const TextStyle(fontSize: 24),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startCounting,
              child: const Text("Start Counting"),
            ),
          ],
        ),
      ),
    );
  }
}
