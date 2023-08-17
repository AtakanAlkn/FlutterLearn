import 'package:flutter/material.dart';
import 'promotion_card.dart';

// ignore: use_key_in_widget_constructors
class PromotionCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Kampanyaları Keşfedin',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        PromotionCard(
          title: 'Kampanya 1',
          content: 'Bu kampanya hakkında bilgi',
          image: 'assets/images/durumle.jpg',
        ),
        PromotionCard(
          title: 'Kampanya 2',
          content: 'Bu kampanya hakkında bilgi',
          image: 'assets/images/kahve.png',
        ),
        PromotionCard(
          title: 'Kampanya 3',
          content: 'Bu kampanya hakkında bilgi',
          image: 'assets/images/kfc.png',
        ),
        PromotionCard(
          title: 'Kampanya 4',
          content: 'Bu kampanya hakkında bilgi',
          image: 'assets/images/toyz.png',
        ),
        PromotionCard(
          title: 'Kampanya 5',
          content: 'Bu kampanya hakkında bilgi',
          image: 'assets/images/neon.png',
        ),
        PromotionCard(
          title: 'Kampanya 6',
          content: 'Bu kampanya hakkında bilgi',
          image: 'assets/images/starbucks.png',
        ),
      ],
    );
  }
}
