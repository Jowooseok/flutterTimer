import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Holdum Dealer Timer',
      home: MyHomePage(title: 'Holdum Dealer Timer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Holdum Dealer Timer'),
        ),
        body: TabBarView(
          children: ['A', 'B', 'C']
              .map((i) => Center(child: Text('$i')))
              .toList(growable: false),
        ),
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(icon: Icons.people, title: 'Players'),
            TabItem(icon: Icons.gamepad, title: 'Gamge'),
            TabItem(icon: Icons.timer, title: 'Timer'),
          ],
          initialActiveIndex: 1, //optional, default as 0
          onTap: (int i) => print('click index=$i'),
        ),
      ),
    );
  }
}
