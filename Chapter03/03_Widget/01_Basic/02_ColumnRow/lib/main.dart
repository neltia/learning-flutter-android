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
        appBar: AppBar(
          title: Text("title"),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            color: Colors.blue,
            child: row6(),
          );
        }));
  }


  column1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.red,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.white,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.green,
          width: 50,
          height: 50,
        ),
      ],
    );
  }

  column2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.red,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.white,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.green,
          width: 50,
          height: 50,
        ),
      ],
    );
  }

  column3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          color: Colors.red,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.white,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.green,
          width: 50,
          height: 50,
        ),
      ],
    );
  }

  column4() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.red,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.white,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.green,
          width: 50,
          height: 50,
        ),
      ],
    );
  }

  column5() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.red,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.white,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.green,
          width: 50,
          height: 50,
        ),
      ],
    );
  }

  column6() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // spaceBetween, spaceAround
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.red,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.white,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.green,
          width: 50,
          height: 50,
        ),
      ],
    );
  }

  row1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.red,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.white,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.green,
          width: 50,
          height: 50,
        ),
      ],
    );
  }

  row2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.red,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.white,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.green,
          width: 50,
          height: 50,
        ),
      ],
    );
  }

  row3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          color: Colors.red,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.white,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.green,
          width: 50,
          height: 50,
        ),
      ],
    );
  }

  row4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.red,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.white,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.green,
          width: 50,
          height: 50,
        ),
      ],
    );
  }

  row5() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.red,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.white,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.green,
          width: 50,
          height: 50,
        ),
      ],
    );
  }


  row6() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // spaceBetween, spaceAround
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.red,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.white,
          width: 50,
          height: 50,
        ),
        Container(
          color: Colors.green,
          width: 50,
          height: 50,
        ),
      ],
    );
  }
}
