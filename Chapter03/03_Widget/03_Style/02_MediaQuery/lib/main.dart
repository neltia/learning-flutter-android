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
        home: HomePage()
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MediaQuery'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 디바이스 화면 크기
              Text('Display Size : ${MediaQuery.of(context).size}'),
              // 디바이스 화면 높이
              Text('Display Height: ${MediaQuery.of(context).size.height}'),
              // 디바이스 화면 너비
              Text('Display Width: ${MediaQuery.of(context).size.width}'),
              // 디바이스 패딩 값
              Text('Display Padding: ${MediaQuery.of(context).padding}'),
              // 스테이터스 바 높이
              Text('Status Bar Height: ${MediaQuery.of(context).padding.top}'),
            ],
          ),
        )
    );
  }
}
