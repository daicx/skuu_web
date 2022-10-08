import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skuu_web/component/my_grid_view.dart';

class MyTabBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyTabBar();
  }
}

class _MyTabBar extends State<MyTabBar> {
  int _selected = 0;
  late String bodyContent;
  final List<String> _tabValues = [];
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabValues.addAll([
      '热榜',
      '问答',
      '图片',
      '娱乐',
      '科技',
      '军事',
      '游戏',
      '搞笑',
      '漫画',
    ]);
    _controller = TabController(
      length: _tabValues.length,
      vsync: ScrollableState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Center(child: getTabBar()),
        actions: <Widget>[
          new Container(
            child: IconButton(
              onPressed: () {
                _controller.animateTo(_controller.index < _controller.length - 1
                    ? _controller.index + 1
                    : 0);
              },
              icon: Icon(Icons.arrow_right),
            ),
            width: 48,
          )
        ],
      ),
      body: TabBarView(
        controller: _controller,
        children: _tabValues.map((f) {
          return MyGridView();
        }).toList(),
      ),
    );
  }

  TabBar getTabBar() {
    return TabBar(
      controller: _controller, //控制器
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: _tabValues.map((e) {
        return Container(
          height: 50,
          width: 80,
          alignment: Alignment.center,
          child: Text(e),
        );
      }).toList(),
    );
  }

  void onItemTrap(int index) {
    setState(() {
      _selected = index;
    });
  }
}
