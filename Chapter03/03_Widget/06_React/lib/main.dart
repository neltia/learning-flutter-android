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
  bool _isStared = false;
  int _count = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            imageSection(),
            titleSection(),
            buttonSection(),
            textSection()
          ],
        ));
  }

  imageSection() {
    return Image.network(
        "https://cdn.pixabay.com/photo/2019/10/20/11/51/mountains-4563464_960_720.jpg",
        fit: BoxFit.fitWidth
    );
  }

  titleSection() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(6.0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Oeschinen Lake Comapgroud",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text(
                  "Kandresteg, Switzerland",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          IconButton(
            icon: Icon(_isStared ? Icons.star : Icons.star_border,
                size: 30, color: Colors.deepOrange),
            onPressed: changeIconStatus,
          ),
          Text('$_count', style: TextStyle(fontSize: 24))
        ],
      ),
    );
  }


  buttonSection() {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[Icon(Icons.call), Text('CALL')],
            ),
            Column(
              children: <Widget>[Icon(Icons.near_me), Text('ROUTE')],
            ),
            Column(
              children: <Widget>[Icon(Icons.share), Text('SHARE')],
            ),
          ],
        ));
  }

  textSection() {
    return Container(
      child: Text(
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
              'Alps. Situated 1,578 meters above sea level, it is one of the '
              'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
              'half-hour walk through pastures and pine forest, leads you to the '
              'lake, which warms to 20 degrees Celsius in the summer. Activities '
              'enjoyed here include rowing, and riding the summer toboggan run.',
          style: TextStyle(fontSize: 16)),
      padding: EdgeInsets.all(15.0),
    );
  }

  void changeIconStatus() {
    setState(() {
      _isStared = !_isStared;
      if (_isStared) {
        _count += 1;
      } else {
        _count -= 1;
      }
    });
  }
}
