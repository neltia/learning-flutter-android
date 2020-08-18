import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
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
        appBar: AppBar(title: Text("리스트타일")),
        body: listtile1());
  }

  listtile1() {
    return ListView(
      children: const <Widget>[
        Card(child: ListTile(title: Text('기본 리스트타일'))),
        Card(
          child: ListTile(
            leading: Icon(Icons.video_library, color: Colors.red),
            title: Text('리딩이 추가된 리스트타일1'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('트레일링이 추가된 리스트타일'),
            trailing: Icon(Icons.more_vert),
          ),
        ),
        Card(
          child: ListTile(
            leading:
            Icon(Icons.video_library, size: 56, color: Colors.red),
            title: Text('트레일링과 리딩이 추가된 리스트타일'),
            trailing: Icon(Icons.more_vert),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('덴스가 추가된 기본 리스트타일'),
            dense: true,
          ),
        ),
        Card(
          child: ListTile(
            leading:
            Icon(Icons.video_library, size: 72, color: Colors.red),
            title: Text('세 줄 옵션을 추가한 리스트타일'),
            subtitle: Text('동해물과 백두산이 마르고 하느님이 보우하사 우리 나라 만세'),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        ),
      ],
    );
  }
}
