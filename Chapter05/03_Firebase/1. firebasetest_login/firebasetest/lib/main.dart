import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart'; // 구글 로그인 관련 패키지

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  // 로그인 초기 상태 (false는 로그인 안함)
  bool _isLoggedIn = false;

  // 유저 정보 저장
  FirebaseUser _user;

  // 로그인 함수
  _login() async {
    try {
      // 구글 로그인 및 인증
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: gSA.idToken, accessToken: gSA.accessToken);

      // 파이어베이스에 인증
      AuthResult authResult = await _auth.signInWithCredential(credential);
      _user = authResult.user;

      setState(() {
        _isLoggedIn = true;
      });
    } catch (err) {
      print(err);
    }
  }

  // 로그아웃 함수
  _logout() {
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: _isLoggedIn
                ? Column(
                    // 로그인 상태에 띄우는 화면
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                        // 사용자 사진 가져오기
                        _googleSignIn.currentUser.photoUrl,
                        height: 50.0,
                        width: 50.0,
                      ),
                      Text(
                          // 사용자 이름 가져오기
                          _googleSignIn.currentUser.displayName),
                      OutlineButton(
                        child: Text("로그아웃"),
                        onPressed: () {
                          _logout();
                        },
                      ),
                    ],
                  )
                : Center(
                    // 로그인하지 않은 상태에 띄우는 화면
                    child: OutlineButton(
                      child: Text("구글로 로그인하기"),
                      onPressed: () {
                        _login();
                      },
                    ),
                  )),
      ),
    );
  }
}
