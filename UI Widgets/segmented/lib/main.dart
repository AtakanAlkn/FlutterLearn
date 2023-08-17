import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DinosaurAcademyHomePage(),
    );
  }
}

class DinosaurAcademyHomePage extends StatefulWidget {
  @override
  _DinosaurAcademyHomePageState createState() =>
      _DinosaurAcademyHomePageState();
}

class _DinosaurAcademyHomePageState extends State<DinosaurAcademyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dinosaur Academy Segmented Control'),
        backgroundColor: Colors.green, // Replace with the desired app bar color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSegmentedControl(),
            SizedBox(height: 20),
            _buildSegmentContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildSegmentedControl() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors
            .green, // Replace with the desired background color for the control
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSegmentItem("Neon Academy 2023", 0),
          _buildSegmentItem("Neon", 1),
          _buildSegmentItem("Apps", 2),
        ],
      ),
    );
  }

  Widget _buildSegmentItem(String title, int index) {
    bool isSelected = index == _selectedIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.lightGreen : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSegmentContent() {
    String content = "";
    switch (_selectedIndex) {
      case 0:
        content = "Neon Academy 2023 content goes here.";
        break;
      case 1:
        content = "Neon content goes here.";
        break;
      case 2:
        content = "Apps content goes here.";
        break;
      default:
        content = "Select a segment to view content.";
    }
    return Text(
      content,
      style: TextStyle(fontSize: 18),
    );
  }
}
