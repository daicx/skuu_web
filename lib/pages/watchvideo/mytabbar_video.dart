import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skuu_web/pages/friends/chat_pagev2.dart';

import 'component_item.dart';
import 'wait_play_video_list.dart';
import '../../component/mycomponent_view.dart';

//控制评论和下一个播放
class MyTabBarVideo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyTabBarVideo();
  }
}

class _MyTabBarVideo extends State<MyTabBarVideo> with SingleTickerProviderStateMixin{
  int _selected = 0;
  late String bodyContent;
  final List<String> _tabValues = [];
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabValues.addAll([
      '弹幕',
      '接下来播放',
    ]);
    _controller = TabController(
      length: _tabValues.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(child: getTabBar()),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          ComponentItem(),
          WaitPlayVideoList(title: '',),
        ],
      ),
    );
  }

  TabBar getTabBar() {
    return TabBar(
      controller: _controller, //控制器
      // isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: _tabValues.map((e) {
        return Container(
          height: 40,
          width: 80,
          alignment: Alignment.center,
          child: Text(
            e,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          ),
        );
      }).toList(),
    );
  }
}
