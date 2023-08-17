import 'package:flutter/material.dart';
import 'package:hero_academy/screens/home.dart';

class ArrowButtons extends StatefulWidget {
  const ArrowButtons({super.key});

  @override
  State<ArrowButtons> createState() => _ArrowButtonsState();
}

class _ArrowButtonsState extends State<ArrowButtons> {
  int a = 3;
  String imagePath = 'assets/images/maze1.png';
  int num = 1;

  int remainingHearts = 3;
  void _decreaseHearts() {
    setState(() {
      remainingHearts = remainingHearts - 1;
      if (remainingHearts == 0) {
        _showGameOverDialog();
      }
    });
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("You're trapped, try again!"),
          actions: <Widget>[
            TextButton(
              child: const Text('Home'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  imagePath = 'assets/images/maze1.png';
                  num = 1;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(),
                      ));
                });
              },
            ),
            TextButton(
              child: const Text('Retry'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  remainingHearts = 3;
                  imagePath = 'assets/images/maze1.png';
                  num = 1;
                });
              },
            ),
          ],
        );
      },
    );
  }

  void _showFinishDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(" Congratulations, you did it!"),
          actions: <Widget>[
            TextButton(
              child: const Text('Home'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  imagePath = 'assets/images/maze1.png';
                  num = 1;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(),
                      ));
                });
              },
            ),
          ],
        );
      },
    );
  }

  void onUpChange() {
    setState(() {
      switch (num) {
        case 1:
          _decreaseHearts();
          break;
        case 2:
          imagePath = 'assets/images/maze1.png';
          num = 1;
          break;
        case 3:
          imagePath = 'assets/images/maze2.png';
          num = 2;
          break;
        case 4:
          imagePath = 'assets/images/maze5.png';
          num = 5;
          break;
        case 5:
          _decreaseHearts();
          break;
        case 6:
          _showFinishDialog();
          break;
        case 7:
          imagePath = 'assets/images/maze6.png';
          num = 6;
          break;
        default:
      }
    });
  }

  void onDownChange() {
    setState(() {
      switch (num) {
        case 1:
          imagePath = 'assets/images/maze2.png';
          num = 2;
          break;
        case 2:
          imagePath = 'assets/images/maze3.png';
          num = 3;
          break;
        case 3:
          _decreaseHearts();
          break;
        case 4:
          _decreaseHearts();
          break;
        case 5:
          imagePath = 'assets/images/maze4.png';
          num = 4;
          break;
        case 6:
          imagePath = 'assets/images/maze7.png';
          num = 7;
          break;
        case 7:
          _decreaseHearts();
          break;
        default:
      }
    });
  }

  void onBackChange() {
    setState(() {
      switch (num) {
        case 1:
          _decreaseHearts();
          break;
        case 2:
          _decreaseHearts();
          break;
        case 3:
          _decreaseHearts();
          break;
        case 4:
          imagePath = 'assets/images/maze2.png';
          num = 2;
          break;
        case 5:
          _decreaseHearts();
          break;
        case 6:
          imagePath = 'assets/images/maze5.png';
          num = 5;
          break;
        case 7:
          _decreaseHearts();
          break;
        default:
      }
    });
  }

  void onForwardChange() {
    setState(() {
      switch (num) {
        case 1:
          _decreaseHearts();
          break;
        case 2:
          imagePath = 'assets/images/maze4.png';
          num = 4;
          break;
        case 3:
          _decreaseHearts();
          break;
        case 4:
          _decreaseHearts();
          break;
        case 5:
          imagePath = 'assets/images/maze6.png';
          num = 6;
          break;
        case 6:
          _decreaseHearts();
          break;
        case 7:
          _decreaseHearts();
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 3; i++)
              Icon(
                i < remainingHearts ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
                size: 30,
              ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Hero(
          tag: 'mazeImage',
          child: Image.asset(imagePath),
        ),
        const SizedBox(
          height: 100,
        ),
        IconButton(
          onPressed: () {
            onUpChange();
          },
          icon: const Icon(
            Icons.arrow_upward,
            color: Colors.black,
            size: 30,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                onBackChange();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                onDownChange();
              },
              icon: const Icon(
                Icons.arrow_downward,
                color: Colors.black,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                onForwardChange();
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.black,
                size: 30,
              ),
            ),
          ],
        )
      ],
    );
  }
}
