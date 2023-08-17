import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Rooms({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rooms',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RoomCard(
                  roomName: 'Living Room',
                  iconData: Icons.weekend,
                ),
                RoomCard(
                  roomName: 'Bedroom',
                  iconData: Icons.bed,
                ),
                RoomCard(
                  roomName: 'Kitchen',
                  iconData: Icons.kitchen,
                ),
                RoomCard(
                  roomName: 'Bathroom',
                  iconData: Icons.bathtub,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RoomCard extends StatefulWidget {
  final String roomName;
  final IconData iconData;

  const RoomCard({Key? key, required this.roomName, required this.iconData})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RoomCardState createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  bool isCardTapped = false;

  @override
  Widget build(BuildContext context) {
    final Color cardColor =
        isCardTapped ? const Color(0XFFEE78A0) : Colors.white; // Renk değişimi

    return InkWell(
      onTap: () {
        setState(() {
          isCardTapped = !isCardTapped;
        });
      },
      child: Card(
        color: cardColor, // Renk değişimi
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.iconData, // Odanın ikonu
                size: 48,
                color: const Color(0XFF27B7BA),
              ),
              const SizedBox(height: 8),
              Text(
                widget.roomName, // Odanın adı
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
