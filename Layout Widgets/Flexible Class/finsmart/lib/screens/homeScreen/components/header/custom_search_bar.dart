import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.search, color: Colors.black),
              const SizedBox(width: 8),
              Text(
                "Arama Yap",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              const Text(
                "CÜZDANLARIM",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 1,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black.withOpacity(0.2),
                  width: 1.0, // Çizgi kalınlığı
                  style: BorderStyle.solid, // Solid çizgi stili
                ),
              ),
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
              height:
                  16), // Sadece alt kısımdan boşluk bırakmak için SizedBox ekledik
        ],
      ),
    );
  }
}
