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
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tab demo"),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                    child: Column(children: <Widget>[
                      Icon(Icons.directions_car),
                      Text("car")
                    ])),
                Tab(icon: Icon(Icons.directions_transit), text: "transit"),
                Tab(icon: Icon(Icons.directions_bike), text: "bike")
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike))
            ],
          ),
        ),
      ),
    );
  }
}
