import 'package:flutter/material.dart';

void textFieldNullCheck(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Encrypted Message not found!'),
        content: const Text('Please enter the encrypted message...'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
