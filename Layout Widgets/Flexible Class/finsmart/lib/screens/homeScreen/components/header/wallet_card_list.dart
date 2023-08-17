import 'package:flutter/material.dart';
import 'wallet_card.dart';

class WalletCardList extends StatelessWidget {
  const WalletCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Yeni Cüzdanları Keşfedin',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 16),
              WalletCard(logoImage: 'assets/images/burger.png'),
              SizedBox(width: 16),
              WalletCard(logoImage: 'assets/images/kfc.png'),
              SizedBox(width: 16),
              WalletCard(logoImage: 'assets/images/toyz.png'),
              SizedBox(width: 16),
              WalletCard(logoImage: 'assets/images/english.png'),
              SizedBox(width: 16),
            ],
          ),
        ),
      ],
    );
  }
}
