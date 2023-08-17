import 'package:flutter/material.dart';

class TravelFooter extends StatefulWidget {
  const TravelFooter({Key? key}) : super(key: key);

  @override
  _TravelFooterState createState() => _TravelFooterState();
}

class _TravelFooterState extends State<TravelFooter> {
  int _selectedIconIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildFooterIcon(Icons.home, 0),
          buildFooterIcon(Icons.search, 1),
          buildFooterIcon(Icons.person, 2),
        ],
      ),
    );
  }

  Widget buildFooterIcon(IconData iconData, int index) {
    bool isSelected = _selectedIconIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIconIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          iconData,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
