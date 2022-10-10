import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../component/my_grid_view.dart';

//查询页面
class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchPage();
  }
}

class _SearchPage extends State<SearchPage> {
  int _selected = 0;
  final controller = TextEditingController();
  final List<String> _historys = [];
  final List<String> _hots = [];
  late TabController _controller;
  bool result = false;

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
            controller: controller,
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
            ),
            onChanged: (a) {
              if (a == '') {
                setState(() {
                  result = false;
                });
              }
            },
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  if (controller.text != '') {
                    setState(() {
                      result = true;
                    });
                  }
                },
                child: Text(
                  '搜索',
                  style: TextStyle(color: Colors.green),
                ),
                style: TextButton.styleFrom(
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.black12)),
          ],
        ),
        body: null);
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
