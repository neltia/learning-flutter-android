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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Scrollbar(child:card2()));
  }

  card2() {
    final List<String> comments = <String>[
      '최신 음악 무제한',
      '뮤직 비디오 무제한',
      '음악 라이브러리 공유',
      '뮤직비디오 업로드',
      '뮤직비디오 공유 무제한'
    ];
    final List<IconData> icons = <IconData>[
      Icons.music_note,
      Icons.music_video,
      Icons.library_music,
      Icons.videocam,
      Icons.video_library
    ];
    final List<String> wons = <String>[
      "2,000",
      "3,000",
      "4,000",
      "5,000",
      "6,000"
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: comments.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(icons[index], color: Colors.redAccent,),
                title: Text('${comments[index]}'),
                subtitle: Text('가격: ${wons[index]}원',),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('신청하기'),
                    onPressed: () {},
                  )
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
