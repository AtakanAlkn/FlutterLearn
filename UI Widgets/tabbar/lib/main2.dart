import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Deneme',
      home: UITabbarController(),
    );
  }
}

class UITabbarController extends StatelessWidget {
  const UITabbarController({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('sadasd'),
            bottom: const TabBar(tabs: <Widget>[
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.youtube_searched_for_sharp),
                    Text('sadasd'),
                  ],
                ),
              )
            ]),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: Text('sadasd'),
              )
            ],
          ),
        ));
  }
}
