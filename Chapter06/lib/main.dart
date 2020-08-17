// Script
import 'package:books/Screens/Splash/LoginPage.dart';

import 'Screens/HomePage.dart';
import 'Screens/Splash/SplashPage.dart';

// Flutter Default Setting
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: SplashPage.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.routeName: {
            return MaterialPageRoute(
                builder: (context) => HomePage(user: (settings.arguments as Map)['user'], books: (settings.arguments as Map)['books'],)
            );
          } break;
          case LoginPage.routeName: {
            return MaterialPageRoute(
                builder: (context) => LoginPage(books: settings.arguments)
            );
          } break;
          default: {
            return MaterialPageRoute(
                builder: (context) => SplashPage()
            );
          } break;
        }
      },
    );
  }
}