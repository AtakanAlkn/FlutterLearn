import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futuretech/footer/footer.dart';
import 'content/content.dart';
import 'header/header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'FutureTech',
      debugShowCheckedModeBanner: false, // Debug banner'ı kaldır
      home: FutureTech(),
    );
  }
}

class FutureTech extends StatelessWidget {
  const FutureTech({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: Header(),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.white,
              child: ListView(
                // Content kısmını ListView içine yerleştir
                children: const [Content()],
              ),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
