import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tabbar',
      home: UITabbarController(), // UITabbarController
    );
  }
}

class UITabbarController extends StatelessWidget {
  const UITabbarController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.green,
          title: const Text('Tabbar'),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.transparent,
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.account_circle_sharp),
                    Text('Tab 1'),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.work_sharp),
                    Text('Tab 2'),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home_sharp),
                    Text('Tab 3'),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_sharp),
                    Text('Tab 4'),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("Content 1"),
            ),
            Center(
              child: Text("Content 2"),
            ),
            Center(
              child: Text("Content 3"),
            ),
            Center(
              child: Text("Content 4"),
            ),
          ],
        ),
      ),
    );
  }
}
