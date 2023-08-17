import 'package:flutter/material.dart';
import 'package:futuretech/content/device.dart';
import 'package:futuretech/content/rooms.dart';
import 'weather.dart';

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.0),
          Weather(
            country: 'Türkiye',
            city: 'İstanbul',
            weatherIcon: Icons.cloud,
            temperature: 33.5,
          ),
          Rooms(),
          SizedBox(height: 20.0),
          Device(),
        ],
      ),
    );
  }
}
