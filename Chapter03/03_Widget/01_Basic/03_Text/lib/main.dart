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
  String _name = "철수";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(alignment: Alignment.center, child: text10()),
    );
  }

  // 폰트 변경
  text1() {
    return Text(
      '안녕, $_name! 잘 지내니?',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80),
    );
  }

  text2() {
    return Text(
      '안녕, $_name! 잘 지내니?',
      style: TextStyle(
          fontWeight: FontWeight.w100,
          fontSize: 20,
          fontStyle: FontStyle.italic),
    );
  }

  text3() {
    return Text(
      '안녕, $_name! 잘 지내니?',
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 80, color: Colors.blueAccent),
    );
  }

  // 오버플로우 방식 변경
  text4() {
    return Text(
      '안녕, $_name! 잘 지내니? AAAABBBBCCCCDDDDEEEEFFFFGGGGHHHHJJJJKKKK',
      overflow: TextOverflow.visible,
      style: TextStyle(fontSize: 80),
    );
  }

  text5() {
    return Text(
      '안녕, $_name! 잘 지내니? AAAABBBBCCCCDDDDEEEEFFFFGGGGHHHHJJJJKKKK',
      overflow: TextOverflow.fade,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80),
    );
  }

  text6() {
    return Text(
      '안녕, $_name! 잘 지내니? AAAABBBBCCCCDDDDEEEEFFFFGGGGHHHHJJJJKKKK',
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80),
    );
  }

  // 정렬 변경
  text7() {
    return Text(
      '안녕, $_name! 잘 지내니? AAAABBBBCCCCDDDDEEEEFFFFGGGGHHHHJJJJKKKK',
      textAlign: TextAlign.center,
      overflow: TextOverflow.fade,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80),
    );
  }

  text8() {
    return Text(
      '안녕, $_name! 잘 지내니? AAAABBBBCCCCDDDDEEEEFFFFGGGGHHHHJJJJKKKK',
      textAlign: TextAlign.start,
      overflow: TextOverflow.fade,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80),
    );
  }

  text9() {
    return Text(
      '안녕, $_name! 잘 지내니? AAAABBBBCCCCDDDDEEEEFFFFGGGGHHHHJJJJKKKK',
      textAlign: TextAlign.end,
      overflow: TextOverflow.fade,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80),
    );
  }

  text10() {
    return Text(
      '안녕, $_name! 잘 지내니? AAAABBBBCCCCDDDDEEEEFFFFGGGGHHHHJJJJKKKK',
      textAlign: TextAlign.justify,
      overflow: TextOverflow.fade,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80),
    );
  }
}
