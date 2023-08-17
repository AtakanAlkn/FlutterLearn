import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Weather extends StatelessWidget {
  final String country;
  final String city;
  final IconData weatherIcon;
  final double temperature;

  const Weather({
    super.key,
    required this.country,
    required this.city,
    required this.weatherIcon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat.Hm().format(now); // Anlık saat bilgisi

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formattedTime, // Anlık saat bilgisi
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$country, $city', // Ülke ve şehir
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Icon(weatherIcon), // Hava durumu simgesi
              const SizedBox(height: 8.0),
              Text(
                '${temperature.toStringAsFixed(1)}°C', // Hava sıcaklığı
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
