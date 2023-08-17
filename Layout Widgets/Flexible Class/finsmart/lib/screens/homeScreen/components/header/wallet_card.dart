import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  final String logoImage;

  const WalletCard({required this.logoImage, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width * 0.4;
    final double cardHeight = cardWidth;

    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            logoImage,
            width: 64,
            height: 64,
          ),
        ],
      ),
    );
  }
}
