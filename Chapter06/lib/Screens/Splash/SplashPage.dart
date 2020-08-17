// Script
import 'dart:async';

// Plugins
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Flutter Default Setting
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);
  static const routeName = '/';

  @override
  _SplashPageState createState() => _SplashPageState();
}

String _message = '';

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    loading();
  }

  loading()async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _message = 'Network Connect...';
    });
    Firestore.instance
        .collection('books')
        .getDocuments()
        .then((value){

      FirebaseAuth.instance.onAuthStateChanged.listen((userData) {
        if (userData == null) {
          Navigator.pushReplacementNamed(context, '/signin', arguments: value);
          return;
        }
        Navigator.pushReplacementNamed(context, '/home', arguments: {'user': userData, 'books': value});
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(),
                Text('Boan Project', style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),),
                Text('$_message', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white),),
                Text('Copyright BoanProject.', style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white),)
              ],
            ),
          ),
        )
    );
  }
}
