import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _colorTween;

  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1800),
      vsync: this,
    );
    _colorTween = _animationController
        .drive(ColorTween(begin: Colors.yellow, end: Colors.blue));
    _animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Progress Indicators")),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircularProgressIndicator(valueColor: _colorTween),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: LinearProgressIndicator(valueColor: _colorTween),
        ),
      ]),
    );
  }
}