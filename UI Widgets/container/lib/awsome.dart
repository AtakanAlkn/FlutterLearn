import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: AwesomeGallery()));
}

class AwesomeGallery extends StatelessWidget {
  const AwesomeGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('AwesomeGallery'),
        ),
        backgroundColor: const Color(0XFFFE946B),
      ),
      body: AwesomeGalleryWidget(),
    );
  }
}

class AwesomeGalleryWidget extends StatelessWidget {
  final List<String> imagePaths =
      List.generate(12, (index) => "assets/images/image_$index.jpg");

  AwesomeGalleryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AwesomeImageZoomPage(
                    imagePath: imagePaths[index]), //Resmi aç
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePaths[index]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}

class AwesomeImageZoomPage extends StatelessWidget {
  final String imagePath;

  // ignore: prefer_const_constructors_in_immutables
  AwesomeImageZoomPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context); // Eski haline dön
          },
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
