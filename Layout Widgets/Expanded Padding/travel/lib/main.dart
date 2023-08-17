import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'content/content.dart';
import 'footer/footer.dart';
import 'header/header.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TravelApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            const Expanded(
              flex: 6,
              child: TravelHeader(),
            ),
            Expanded(
              flex: 13,
              child: Container(
                color: Colors.white,
                child: const TravelContent(),
              ),
            ),
            const Expanded(flex: 1, child: TravelFooter()),
          ],
        ),
      ),
    );
  }
}
