import 'package:flutter/material.dart';

class BlacksmithButton extends StatefulWidget {
  @override
  _BlacksmithButtonState createState() => _BlacksmithButtonState();
}

class _BlacksmithButtonState extends State<BlacksmithButton> {
  bool isSecondButtonActive = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                isSecondButtonActive = !isSecondButtonActive;
              });
            },
            child: Text('Button 1'),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: isSecondButtonActive ? () {} : null,
            child: Text('Button 2'),
          ),
        ],
      ),
    );
  }
}
