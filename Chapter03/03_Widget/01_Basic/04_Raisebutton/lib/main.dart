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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                raisedButton1(),
                Padding(padding: EdgeInsets.all(10)),
                raisedButton2(),
                Padding(padding: EdgeInsets.all(10)),
                raisedButton3(),
                Padding(padding: EdgeInsets.all(10)),
                raisedButton4(),
              ],
            )));
  }

  raisedButton1() {
    return RaisedButton(
      onPressed: null,
      child: Text('비활성화된 버튼', style: TextStyle(fontSize: 20)),
    );
  }

  raisedButton2() {
    return RaisedButton(
      onPressed: () {},
      child: Text('활성화된 버튼', style: TextStyle(fontSize: 20)),
    );
  }

  raisedButton3() {
    return RaisedButton(
      onPressed: () {},
      child: Container(
          width: 300,
          height: 100,
          alignment: Alignment.center,
          child: Text('크기를 조절한 버튼', style: TextStyle(fontSize: 20))),
    );
  }

  raisedButton4() {
    return RaisedButton(
      color: Colors.blueAccent,
      onPressed: () {},
      child: Container(
          width: 300,
          height: 100,
          alignment: Alignment.center,
          child: Text('색상을 변경한 버튼',
              style: TextStyle(fontSize: 20, color: Colors.white))),
    );
  }
}
