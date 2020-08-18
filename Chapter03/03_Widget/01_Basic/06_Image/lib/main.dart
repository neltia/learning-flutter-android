import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
          image5(),
          Text("Image by Noel Bauza from Pixabay")
        ],)
    );
  }

  image1() {
    return Image.asset('assets/images/cuba-1197800_640.jpg');
  }

  image2() {
    return Image.network('https://bit.ly/2ZEq4qr');
  }

  image3() {
    return Container(
      height: 100,
      width: 400,
      color: Colors.yellow,
      child:
      Image.asset('assets/images/cuba-1197800_640.jpg', fit: BoxFit.fill),
    );
  }

  image4() {
    return Container(
      height: 100,
      width: 400,
      color: Colors.yellow,
      child:
      Image.asset('assets/images/cuba-1197800_640.jpg', fit: BoxFit.fitHeight),
    );
  }

  image5() {
    return Container(
      height: 100,
      width: 400,
      color: Colors.yellow,
      child:
      Image.asset('assets/images/cuba-1197800_640.jpg', fit: BoxFit.fitWidth,),
    );
  }
}
