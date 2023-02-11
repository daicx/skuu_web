import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skuu_web/pages/search/search_item_v2.dart';

//查询页面
class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchPage();
  }
}

class _SearchPage extends State<SearchPage> {
  int _selected = 0;
  final searchController = TextEditingController();
  Color removeBtnColor = Colors.transparent;
  final List<String> _historys = [];
  final List<String> _hots = [];
  late TabController _controller;
  bool result = false;
  String searchText = "";

  @override
  void initState() {
    super.initState();
    _historys.addAll([
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
    ]);
    _hots.addAll([
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black87),
          backgroundColor: Colors.white,
          title: TextField(
            controller: searchController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: 'Search',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFDCDFE6)),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF409EFF)),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              suffixIcon: IconButton(
                  icon: Icon(Icons.highlight_remove, color: removeBtnColor),
                  onPressed: () {
                    setState(() {
                      searchController.clear();
                      removeBtnColor = Colors.transparent;
                    });
                  }),
            ),
            onChanged: (a) {
              if (a == '') {
                setState(() {
                  result = false;
                  removeBtnColor = Colors.transparent;
                });
              } else {
                setState(() {
                  removeBtnColor = Colors.grey;
                });
              }
            },
          ),
          actions: <Widget>[
            CupertinoButton(
              onPressed: () {
                if (searchController.text != '') {
                  setState(() {
                    result = true;
                  });
                }
              },
              child: Text(
                '搜索',
                // style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body: SearchItemV2());
  }

// Text组件需要用SliverToBoxAdapter包裹，才能作为CustomScrollView的子组件
  Widget renderTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  void onItemTrap(int index) {
    setState(() {
      _selected = index;
    });
  }
}
