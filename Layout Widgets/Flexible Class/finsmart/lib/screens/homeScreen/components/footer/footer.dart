import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Colors.white.withOpacity(0.9), // Beyaz transparan arka plan
      ),
      padding: const EdgeInsets.all(16),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: FooterMenuItem(
              icon: Icons.account_balance_wallet,
              text: 'CÜZDANLAR',
            ),
          ),
          Expanded(
            child: FooterMenuItem(
              icon: Icons.card_giftcard,
              text: 'KAMPANYALAR',
            ),
          ),
          Expanded(
            child: FooterMenuItem(
              icon: Icons.monetization_on,
              text: 'BAKİYE',
            ),
          ),
          Expanded(
            child: FooterMenuItem(
              icon: Icons.history,
              text: 'GEÇMİŞ',
            ),
          ),
        ],
      ),
    );
  }
}

class FooterMenuItem extends StatefulWidget {
  final IconData icon;
  final String text;

  const FooterMenuItem({
    required this.icon,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FooterMenuItemState createState() => _FooterMenuItemState();
}

class _FooterMenuItemState extends State<FooterMenuItem> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: _isSelected ? Colors.black : Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 217, 193, 193).withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              widget.icon,
              color: _isSelected ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
