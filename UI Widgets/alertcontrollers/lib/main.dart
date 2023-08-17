import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AlertControl(),
    );
  }
}

class AlertControl extends StatelessWidget {
  void _showSimpleAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Simple Alert"),
          content: Text("This is a simple alert with no buttons."),
        );
      },
    );
  }

  void _showOneButtonAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("One Button Alert"),
          content: Text("This is an alert with one button."),
          actions: [
            TextButton(
              onPressed: () {
                print("Button 1 clicked!");
              },
              child: Text("Button 1"),
            ),
          ],
        );
      },
    );
  }

  void _showTwoButtonAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Two Button Alert"),
          content: Text("This is an alert with two buttons."),
          actions: [
            TextButton(
              onPressed: () {
                print("Button 1");
              },
              child: Text("Button 1"),
            ),
            TextButton(
              onPressed: () {
                print("Button 2");
              },
              child: Text("Button 2"),
            ),
          ],
        );
      },
    );
  }

  void _showTextFieldAlert(BuildContext context) {
    TextEditingController _textFieldController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Text("Text Field Alert"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("This is an alert with a text field."),
              TextField(
                controller: _textFieldController,
                decoration: InputDecoration(labelText: "Enter text"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                print("Text entered: ${_textFieldController.text}");
                Navigator.pop(context);
              },
              child: Text("Print Text"),
            ),
          ],
        );
      },
    );
  }

  void _showActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: [
              ListTile(
                title: Text("Option 1"),
                onTap: () {
                  print("Option 1 selected!");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Option 2"),
                onTap: () {
                  print("Option 2 selected!");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Option 3"),
                onTap: () {
                  print("Option 3 selected!");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showActivityController(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: [
              ListTile(
                title: Text("Share File"),
                onTap: () {
                  print("Share File selected!");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Share Image"),
                onTap: () {
                  print("Share Image selected!");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Controllers"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _showSimpleAlert(context),
              child: Text("Show Simple Alert"),
            ),
            ElevatedButton(
              onPressed: () => _showOneButtonAlert(context),
              child: Text("Show One Button Alert"),
            ),
            ElevatedButton(
              onPressed: () => _showTwoButtonAlert(context),
              child: Text("Show Two Button Alert"),
            ),
            ElevatedButton(
              onPressed: () => _showTextFieldAlert(context),
              child: Text("Show Text Field Alert"),
            ),
            ElevatedButton(
              onPressed: () => _showActionSheet(context),
              child: Text("Show Action Sheet"),
            ),
            ElevatedButton(
              onPressed: () => _showActivityController(context),
              child: Text("Show Activity Controller"),
            ),
          ],
        ),
      ),
    );
  }
}
