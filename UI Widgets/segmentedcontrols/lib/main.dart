import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoSegmentedControl(),
    );
  }
}

class CupertinoSegmentedControl extends StatefulWidget {
  const CupertinoSegmentedControl({super.key});

  @override
  CupertinoSegmentedControlState createState() =>
      CupertinoSegmentedControlState();
}

class CupertinoSegmentedControlState extends State<CupertinoSegmentedControl> {
  int _selectedIndex = 0;
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segmented Control'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSegmentedControl(),
            const SizedBox(height: 20),
            Expanded(child: _buildSegmentContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildSegmentedControl() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(_isExpanded ? 20 : 12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: _buildSegmentItem(
                "Neon Academy 2023", 0, const Color.fromARGB(255, 124, 255, 1)),
          ),
          Expanded(
            child: _buildSegmentItem("Neon", 1, Colors.yellow),
          ),
          Expanded(
            child: _buildSegmentItem(
                "Apps", 2, const Color.fromARGB(255, 0, 68, 255)),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentItem(String title, int index, Color color) {
    bool isSelected = index == _selectedIndex;
    double fontSize = isSelected ? 20.0 : 16.0;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          _isExpanded = index == 0;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
            horizontal: isSelected ? 20 : 16, vertical: isSelected ? 12 : 8),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(_isExpanded ? 20 : 8),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSegmentContent() {
    Widget contentWidget;

    switch (_selectedIndex) {
      case 0:
        contentWidget = _buildColoredBox(Colors.red, 200.0);
        break;
      case 1:
        contentWidget = _buildColoredBox(Colors.green, 100.0);
        break;
      case 2:
        contentWidget = _buildColoredBox(Colors.blue, 50.0);
        break;
      default:
        contentWidget = _buildColoredBox(Colors.white, 80.0);
    }

    return Center(child: contentWidget);
  }

  Widget _buildColoredBox(Color color, double boxSize) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: boxSize,
      height: boxSize,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(boxSize / 6),
      ),
    );
  }
}
