import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _selectedIconIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildFooterIcon(Icons.person, 0),
            buildFooterIcon(Icons.home, 1),
            buildFooterIcon(Icons.settings, 2),
          ],
        ),
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
          color: isSelected ? Color(0XFFEE4446) : Colors.white,
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
