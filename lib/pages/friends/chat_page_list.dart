import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skuu_web/constant/constant.dart';
import 'package:skuu_web/pages/friends/chat_pagev2.dart';

import '../../route/routers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: ChatPageList(),
    );
  }
}

//好友列表
class ChatPageList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChatPageList();
  }
}

class _ChatPageList extends State<ChatPageList> {
  late List<String> _datas;
  String content = '测试赛';
  int index = 0;
  bool ignore = false;
  final String useDefault = 'imgs/user_default.png';

  @override
  void initState() {
    super.initState();
    _datas = [
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Expanded(
        flex: 2,
        child: Container(
          child: ListView.builder(
            itemCount: _datas.length,
            itemExtent: Constant.HEAD_IMG_SEZE + 20,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            },
          ),
        ),
      ),
      if (1.sw > Constant.CHAT_TWO_VIEW_WIDTH)
        Expanded(
          flex: 5,
          child: Container(
            color: Colors.greenAccent,
            child: ChatPageV2(chatId: index),
          ),
        ),
    ]);
  }

  Widget getRow(int i) {
    double notiSize = 25;
    return ListTile(
      selected: index == i,
      selectedTileColor: Constant.SELECT_COLOR,
      leading: Image.asset(
        useDefault,
        width: Constant.HEAD_IMG_SEZE,
        height: Constant.HEAD_IMG_SEZE,
        fit: BoxFit.fill,
      ),
      title: Container(
        padding: EdgeInsets.only(top: 10),
        decoration: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.black12)),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '北京$i群',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '晴天：大大大大大热大大大大热大大大大热',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  )
                ],
              ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onHover: (a) {},
                  onTap: () {
                    setState(() {
                      ignore = !ignore;
                    });
                  },
                  child: Icon(
                    ignore ? Icons.notifications_off : Icons.notifications,
                    color: Colors.grey,
                    size: notiSize,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '12:00',
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          index = i;
          //记录选中的下标
          if (1.sw < Constant.CHAT_TWO_VIEW_WIDTH)
            Routes.navigateTo(context, Routes.chat, params: {
              'chatId': [index.toString()]
            });
        });
      },
    );
  }
}
