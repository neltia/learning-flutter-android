import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Swiper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Swiper'),
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
  final List<String> imgList = [
    'https://reasley.com/wp-content/uploads/2020/04/one.jpg',
    'https://reasley.com/wp-content/uploads/2020/04/two.jpg',
    'https://reasley.com/wp-content/uploads/2020/04/three.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          height: 250,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Swiper(
                control: SwiperControl(),
                pagination: SwiperPagination(),
                itemCount: imgList.length,
                itemBuilder: (BuildContext context, int index){
                  return Image.network(imgList[index]);
                }
            ),
          ),
        )
    );
  }
}
