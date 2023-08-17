import 'dart:async';

import 'package:flutter/material.dart';

class CustomAlert {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Please wait"),
          content: CountdownWidget(),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                showJokePopup(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  static void showJokePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Joke!!!"),
          content: const Text("it was just a joke! Ticket Canceled"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

// ignore: use_key_in_widget_constructors
class CountdownWidget extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  int countdown = 10000; // Saniye

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (mounted) {
          setState(() {
            countdown--;
            if (countdown == 0) {
              timer.cancel();
            }
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(countdown.toString());
  }
}
