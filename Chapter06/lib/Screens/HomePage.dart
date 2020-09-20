import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../WebView.dart';
import 'Insert/BookPage.dart';
import 'Insert/SearchPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.user, this.books,}) : super(key: key);
  static const routeName = '/home';
  final FirebaseUser user;
  var books;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin{
  ScrollController _scrollViewController;
  TabController _tabController;
  int _numberOfTabs;

  final nameHolder = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _keyword = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _numberOfTabs = 3;
    _tabController = TabController(vsync: this, length: _numberOfTabs);
    _scrollViewController = ScrollController();
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _tabController.dispose();
  }

  Future<List> gets()async{
    String url = 'https://www.googleapis.com/youtube/v3/search?';
    String query = 'q=플러터';
    String key = '[Your API Key]';
    String part = 'snippet';
    String maxResults = '7';
    String type = 'video';

    List jsonData = [];

    url = '$url$query&key=$key&part=$part&maxResults=$maxResults&type=$type';
    await http.get(url, headers: {"Accept": "application/json"}).then((value){
      var data = json.decode(value.body);
      for (var c in data['items']) {
        jsonData.add(c);
      }
    });
    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    FutureBuilder lectureTab(){
      return FutureBuilder(
          future: gets(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData == false) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(fontSize: 15),
                ),
              );
            }
            else {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(text: '인기 강의들 ', style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),),
                                  TextSpan(text: 'Picks 추천 [sample]', style: TextStyle(fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),),
                                ]
                            )
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.all(10),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => WebViewPage(title: snapshot.data[index]['snippet']['title'], baseUrl: 'https://www.youtube.com/user/ngnicky1209',))
                              );
                            },
                            child: Card(
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  height: 90,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 150,
                                        child: Image.network(snapshot.data[index]['snippet']['thumbnails']['medium']['url'],),
                                      ),

                                      SizedBox(
                                        width: 14,
                                      ),

                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data[index]['snippet']['title'],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Spacer(),
                                            Text(
                                              snapshot.data[index]['snippet']['channelTitle'],
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            Text(
                                              snapshot.data[index]['snippet']['publishTime'],
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            )
                          );
                        }),
                  )
                ],
              );
            }
          }
      );
    }


    Widget homeTab = SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 210,
            child: Swiper(
                autoplay: true,
                pagination: SwiperPagination(),
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                    },
                    child: Image(
                      image: AssetImage(
                          'assets/images/we_make_book1.png'
                      ),
                    ),
                  );
                }
            ),
          ),
          Padding(
            padding: EdgeInsets.all(6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ink(context, '공지사항', Icons.search, 'http://www.boanproject.com/'),
                ink(context, '전체 게시판', Icons.text_fields, 'https://cafe.naver.com/boanproject/28722'),
                ink(context, '활동 계획 게시판', Icons.share, 'http://www.boanproject.com/'),
                ink(context, 'Q&A 게시판', Icons.question_answer, 'http://www.boanproject.com/'),
                ink(context, '도서 추천 게시판', Icons.book, 'http://www.boanproject.com/'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: Text('추천하는 온오프믹스 모임', style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Container(
                      color: Color(0xFF105AA1),
                      height: 2.5,
                    ),
                  )
                ],
              )
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  metting(context, '데브옵스를 위한 쿠버네티스 마스터', '보안프로젝트', true, 'assets/images/we_make_book1.png', 'https://www.onoffmix.com/event/221403', 57, false),
                  metting(context, 'IT 보안을 위한 ELK 통합로그시스템 구축과 활용', '보안프로젝트', false, 'assets/images/we_make_book2.jpg', 'https://www.onoffmix.com/event/221407', 100, true)
                ],
              ),
            ),
          ),
        ],
      ),
    );



    Widget booksTab = Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: '인기 작품들 ', style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),),
                        TextSpan(text: 'Picks 추천 [sample]', style: TextStyle(fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),),
                      ]
                  )
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: widget.books.documents.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookPage(user: widget.user, Book_data: widget.books, number: index))
                    );
                  },
                  child: Card(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: 140,
                        height: 140,
                        child: Row(
                          children: [
                            Image.network(widget.books.documents[index]['img_url']),

                            SizedBox(
                              width: 14,
                            ),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.books.documents[index]['name'],
                                    style: TextStyle(
                                        fontSize: 15
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    widget.books.documents[index]['author'],
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),
                                  ),
                                  Text(widget.books.documents[index]['publisher']),
                                  Text(
                                    '${numberWithComma(widget.books.documents[index]['value'])}원',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                );
              }
          ),
        ),
      ],
    );



    return Scaffold(
        resizeToAvoidBottomInset : false, // keyboard not slide
        drawer: slidePage(),
        key: _scaffoldKey,
        body: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white, // app bar color
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  centerTitle: true,
                  background: Column(
                    children: <Widget>[
                      appBarAbove(),
                      appBarBelow(),
                    ],
                  ),
                ),
                leading: Container(), // hambuger menu hide
                expandedHeight: 140, // 탭바의 높이
                pinned: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.blueAccent, // 현재 보고 있는 탭을 가리키는 지시자
                  indicatorWeight: 6.0,
                  tabs: <Tab>[
                    Tab(text: "Home"),
                    Tab(text: "인기 도서 목록"),
                    Tab(text: "추천 강의 영상"),
                  ],
                  controller: _tabController,
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              homeTab,
              booksTab,
              lectureTab(),
            ],
          ),
        )
    );
  }


  Widget slidePage() {
    return Container(
        width: MediaQuery.of(context).size.width/1.2,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: <Widget>[
                        Text('보안프로젝트'),
                        Spacer(),
                        SizedBox(
                          width: 15,
                        ),
                        IconButton(
                          icon: Icon(Icons.power_settings_new),
                          onPressed: () async{
                            await FirebaseAuth.instance.signOut();
                            Navigator.pushNamedAndRemoveUntil(context, '/signin', (route) => false);
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  child: Center(
                    child: ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  widget.user.photoUrl
                              ),
                            )
                        ),
                      ),
                      title: Text(widget.user.displayName),
                      subtitle: Text(widget.user.email),
                      trailing: Icon(Icons.arrow_forward_ios,),
                    )
                  ),
                ),

                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.centerLeft,
                          color: Color(0xFFF2F2F2),
                          width: MediaQuery.of(context).size.width,
                          height: 35,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('인프런/강의 추천', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                          )
                      ),
                      ListTile(
                        title: Text('IT인을 위한 ELK 통합로그시스템 구축과 활용'),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WebViewPage(title: 'IT인을 위한 ELK 통합로그시스템 구축과 활용', baseUrl: 'https://www.inflearn.com/course/ELK-%ED%86%B5%ED%95%A9%EB%A1%9C%EA%B7%B8%EC%8B%9C%EC%8A%A4%ED%85%9C-IT%EB%B3%B4%EC%95%88',))
                          );
                        },
                      ),
                      ListTile(
                        title: Text('iOS 모바일 앱 모의해킹 (입문자편)'),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WebViewPage(title: 'iOS 모바일 앱 모의해킹 (입문자편)', baseUrl: 'https://www.inflearn.com/course/ios-%EB%AA%A8%EB%B0%94%EC%9D%BC%EC%95%B1-%EB%AA%A8%EC%9D%98%ED%95%B4%ED%82%B9-%EC%9E%85%EB%AC%B8',))
                          );
                        },
                      ),
                      ListTile(
                        title: Text('플러터(Flutter) 앱 개발 입문부터 프로젝트 완성까지'),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WebViewPage(title: '플러터(Flutter) 앱 개발 입문부터 프로젝트 완성까지', baseUrl: 'https://www.inflearn.com/course/%ED%94%8C%EB%9F%AC%ED%84%B0-%EB%AA%A8%EB%B0%94%EC%9D%BC%EC%95%B1-%EC%9E%85%EB%AC%B8#',))
                          );
                        },
                      ),
                      RaisedButton(
                        child: Text("강의 목록 바로가기"),
                        color: Colors.white,
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WebViewPage(title: '인프런 보안 프로젝트', baseUrl: 'https://www.inflearn.com/courses?s=%EB%B3%B4%EC%95%88%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8',))
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                    child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Container(
                            child: Column(
                              children: <Widget>[
                                Divider(),
                                ListTile(
                                    leading: Icon(Icons.settings),
                                    title: Text('Settings')),
                                ListTile(
                                    onTap: (){
                                    },
                                    leading: Icon(Icons.help),
                                    title: Text('Developer Blog')
                                )
                              ],
                            )
                        )
                    )
                )
              ],
            )
        )
    );
  }

  Widget appBarAbove() {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, right: 4.5, left: 4.5),
      child: Container(
        height: 36,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                size: 28,
                color: Colors.blueAccent,
              ),
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 8),
                width: 100,
                child: Image(
                  image: AssetImage('assets/images/bp.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
  Widget appBarBelow() {
    return Padding(
        padding: EdgeInsets.only(top: 0, right: 17, left: 17),
        child: TextField(
          controller: nameHolder,
          autocorrect: true ,
          decoration: InputDecoration(
            suffixIcon: Container(
                width: 110,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.search,
                          size: 40,
                          color: Colors.black
                      ),
                      onPressed: (){
                        _keyword = nameHolder.text;
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SearchPage(_keyword, widget.books))
                        );
                        nameHolder.clear();
                      },
                    ),
                  ],
                )
            ),
            hintText: '무조건 돈이 되는 공부를 하라',
            hintStyle: TextStyle(fontSize: 15),
          ),
        )
    );
  }
}

String numberWithComma(int param){
  return NumberFormat('###,###,###,###').format(param).replaceAll(' ', '');
}

Widget ink(BuildContext context, String title, IconData icon, String url){
  return InkWell(
    child: Column(
      children: <Widget>[
        Icon(
          icon,
          size: 50,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 12
          ),
        )
      ],
    ),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WebViewPage(title: title, baseUrl: url,)
        )
      );
    }
  );
}


Widget metting(BuildContext context, String title, String organizer,bool status, String imageUrl, String siteUrl, int percent, bool participation){
  double percentBar = 166 * percent / 100;
  return Container(
    height: 210,
    width: 170,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WebViewPage(title: title, baseUrl: siteUrl,)
              )
            );
          },
          child: Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Image(
                height: 80,
                width: 300,
                image: AssetImage(
                  imageUrl,
                ),
              ),
              Container(
                  height: 30,
                  width: 80,
                  color: Color(0xFF646464),
                  child: Center(
                    child: status
                      ? Text('모집 중', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),)
                      : Text('모집종료', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
                  )
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                overflow: TextOverflow.ellipsis,
                strutStyle: StrutStyle(fontSize: 12.0),
                text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    text: title),
              ),
              Text(organizer, style: TextStyle(color: Color(0xFF8D8D8D))),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Container(
              height: 10,
              width: percentBar,
              color: Colors.blue,
            ),
            Container(
              height: 10,
              width: 166 - percentBar,
              color: Colors.grey,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              status
              ? Text('투표 중')
              : Text('투표종료'),
              Spacer(),
              Text('$percent% '),
              participation
              ? Text('참여')
              : Text('미참여')
            ],
          ),
        ),
      ],
    ),
  );
}
