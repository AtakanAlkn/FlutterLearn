import 'package:flutter/material.dart';
import 'custom_card.dart';

// ignore: use_key_in_widget_constructors
class CustomCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.33,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CustomCard(
            title: 'Neon Apps',
            image: 'assets/images/neon.png',
            backgroundColor: Color(0XFF7D00AA),
            balance: 100,
            points: 50,
          ),
          CustomCard(
            title: 'Starbucks',
            image: 'assets/images/starbucks.png',
            backgroundColor: Color(0XFF017143),
            balance: 500,
            points: 250,
          ),
          CustomCard(
            title: 'Kahve Dünyası',
            image: 'assets/images/kahve.png',
            backgroundColor: Color(0XFF6D0633),
            balance: 750,
            points: 300,
          ),
        ],
      ),
    );
  }
}
