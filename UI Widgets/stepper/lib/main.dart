import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "The Doll's Dress Up Stepper",
      home: DollsDressUpStepper(),
    );
  }
}

class DollsDressUpStepper extends StatefulWidget {
  @override
  _DollsDressUpStepperState createState() => _DollsDressUpStepperState();
}

class _DollsDressUpStepperState extends State<DollsDressUpStepper> {
  int _currentValue = 0;

  void _incrementValue() {
    //Arttır
    setState(() {
      if (_currentValue + 5 <= 50) {
        _currentValue += 5;
      }
    });
  }

  void _decrementValue() {
    //Azalt
    setState(() {
      if (_currentValue - 5 >= 0) {
        _currentValue -= 5;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("The Doll's Dress Up Stepper")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              color: Colors.pink,
              child: Center(
                child: Text(
                  _currentValue.toString(),
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    _decrementValue();
                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          'assets/images/doll2.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Positioned(
                        top: 50,
                        right: 50,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    _incrementValue();
                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          'assets/images/doll.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Positioned(
                        top: 50,
                        right: 50,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
