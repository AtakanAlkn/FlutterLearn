import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _selectedIconIndex = 1; // Varsayılan olarak seçili ikon

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Container(
        color: Colors.grey[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildFooterIcon(Icons.person, 0), // Profil ikonu
            buildFooterIcon(Icons.home, 1), // Home ikonu
            buildFooterIcon(Icons.settings, 2), // Ayarlar ikonu
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
