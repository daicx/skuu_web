import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../route/routers.dart';
import 'mychat_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: ChatPage(),
    );
  }
}

//好友列表
class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChatPage();
  }
}

class _ChatPage extends State<ChatPage> {
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
    ];
  }

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;

    return Scaffold(
        body:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
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
      if (wid > 700)
        Expanded(
          flex: 5,
          child: Container(
            color: Colors.greenAccent,
            child: MyChatView(
              title: "众里寻他千百度" + index.toString(),
            ),
          ),
        ),
    ]));
  }

  Widget getRow(int i) {
    double notiSize = 20;
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
              useDefault,
              width: 50,
              height: 50,
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '啊发防腐剂发防腐剂发防腐剂发防腐剂爱',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '大大大大大热',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '12:00',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  SizedBox(
                    height: 5,
                  ),
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          index = i;
          //记录选中的下标
          if(MediaQuery.of(context).size.width<700)
          Routes.navigateTo(context, Routes.chat,params: {'title': ['众里寻他千百度']});
        });
      },
    );
  }
}
