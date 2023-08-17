import 'package:flutter/material.dart';
import 'dream_destinaton_list.dart';

void main() {
  runApp(const MyApp());
}

class DreamDestination {
  final String name;
  bool visited;
  int visitCount;
  String details;
  Color backgroundColor;

  DreamDestination({
    required this.name,
    required this.visited,
    required this.visitCount,
    required this.details,
    required this.backgroundColor,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dream Destinations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DestinationListScreen(),
    );
  }
}
