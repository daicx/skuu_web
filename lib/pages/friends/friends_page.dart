import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../route/routers.dart';
import 'friend_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: FriendsPage(),
    );
  }
}

//好友列表
class FriendsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FriendsPage();
  }
}

class _FriendsPage extends State<FriendsPage> {
  late List<String> _datas;
  String content = '测试赛';
  int index = 0;
  bool ignore = false;

  @override
  void initState() {
    super.initState();
    _datas = [
      "发发发1",
      "发发发2",
      "发发发3",
      "发发发4",
      "发发发5",
      "发发发6",
      "发发发7",
      "发发发8",
      "发发发9",
      "发发发11",
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
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            },
          ),
        ),
      ),
      if (MediaQuery.of(context).size.width > 700)
        Expanded(
          flex: 5,
          child: Container(
            color: Colors.black12,
            alignment: Alignment.center,
            child: Container(
              width: 400,
              height: 400,
              child: FriendDetail(
                title: _datas[index] + index.toString(),
              ),
            ),
          ),
        ),
    ]);
  }

  Widget getRow(int i) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        //Container下的color属性会与decoration下的border属性冲突，所以要用decoration下的color属性
        decoration: BoxDecoration(
          color: index == i ? Colors.black12 : Colors.white,
          border: Border(
            left: BorderSide(
                width: 5,
                color:
                    index == i ? Theme.of(context).primaryColor : Colors.white),
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              'imgs/user_default.png',
              width: 50,
              height: 50,
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 5,
              child: Text(
                '新飞飞',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          index = i; //记录选中的下标
          if (MediaQuery.of(context).size.width < 700)
            Routes.navigateTo(context, Routes.friendDetail, params: {
              'title': ['众里寻他千百度']
            });
        });
      },
    );
  }
}
