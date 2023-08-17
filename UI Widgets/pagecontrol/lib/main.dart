import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Center(
          child: Text('Page Control'),
        )),
        body: const MyPageControl(),
      ),
    );
  }
}

class MyPageControl extends StatefulWidget {
  const MyPageControl({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyPageControlState createState() => _MyPageControlState();
}

class _MyPageControlState extends State<MyPageControl> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentPageIndex = index;
        });
      },
      children: <Widget>[
        buildPageWithContent(
            "Title 1", "Subtitle 1", Colors.red, "assets/images/dog.jpg"),
        buildPageWithContent(
            "Title 2", "Subtitle 2", Colors.green, "assets/images/cat.jpg"),
        buildPageWithContent(
            "Title 3", "Subtitle 3", Colors.blue, "assets/images/bird.jpg"),
      ],
    );
  }

  Widget buildPageWithContent(
      String title, String subTitle, Color color, String imagePath) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            subTitle,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Image.asset(
            imagePath,
            width: 200,
            height: 200,
          ),
        ],
      ),
    );
  }
}
