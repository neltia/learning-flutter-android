import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
    return Scaffold(
        appBar: AppBar(
          title: Text('Stack',),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: Colors.red, // 하층
            ),
            Container(
              width: 90,
              height: 90,
              color: Colors.green, // 중층
            ),
            Container(
              width: 80,
              height: 80,
              color: Colors.blue, //상층
            ),
          ],
        )
    );
  }
}
