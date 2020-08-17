import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final String keyword;
  var dbs;
  SearchPage(this.keyword, this.dbs);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filter(widget.keyword);
  }
  var items = List<String>();
  void filter(String query) {
    List<String> allData = [];
    List<String> second = List<String>();
    for(var title in widget.dbs.documents){
      allData.add(title['name']);
    }
    second.addAll(allData);

    if(query.isNotEmpty) {
      List<String> resultData = List<String>();
      second.forEach((item) {
        if(item.contains(query)) {
          resultData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(resultData);
      });
      return;
    }

    else {
      setState(() {
        items.clear();
        items.addAll(allData);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.keyword == ''
        ? Text('모든 검색결과')
        : Text("'${widget.keyword}' 의 검색 결과")
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(items[index]),
          );
        }
      )
    );
  }
}
