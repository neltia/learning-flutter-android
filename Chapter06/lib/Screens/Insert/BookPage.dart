import 'package:intl/intl.dart';

import '../HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Payment.dart';

class BookPage extends StatelessWidget {
  List Payment_data;
  var Book_data;
  int number;

  FirebaseUser user;
  BookPage({Key key, @required this.user, this.number, this.Book_data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Book_data.documents[number];
    return Scaffold(
      appBar: AppBar(
        title: Text('도서'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 8, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(data['name'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            Text('컴퓨터 > IT 개발 > 프로그래밍'),

            Text('저자: ${data['author']} | 판매처: ${data['publisher']}'),
            Text('판매가: ${numberWithComma(data['value'])}', style: TextStyle(color: Colors.blueAccent, fontSize: 20),),


            Container(
              height: 400,
              child: Image.network(data['img_url']),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            MaterialButton(
                minWidth: MediaQuery.of(context).size.width/3,
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () async{
                },
                child: Row(
                  children: [
                    Icon(
                        Icons.info
                    ),
                    Text(' 상세정보')
                  ],
                )
            ),
            MaterialButton(
                minWidth: MediaQuery.of(context).size.width/3,
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () async{
                  List payment_data = [];
                  payment_data.add(user.displayName);
                  payment_data.add(user.phoneNumber);
                  payment_data.add(user.email);
                  payment_data.add(data['name']);
                  payment_data.add(data['isbn']);
                  payment_data.add(data['value']);
                  print(payment_data);


                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Payment(Payment_info: payment_data),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                        Icons.shopping_cart
                    ),
                    Text(' 바로구매')
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}