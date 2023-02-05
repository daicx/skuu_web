import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mybutton.dart';

void main() => runApp(MyApp());

//发表作品 页面
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: MySharePage(),
    );
  }
}

class MySharePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MySharePage();
  }
}

class _MySharePage extends State<MySharePage> {
  int _selected = -1;
  List<String> imgs = [];

  @override
  void initState() {
    super.initState();
    imgs.addAll([
      "imgs/user_default.png",
      "imgs/me.png",
      "imgs/user_default.png",
      "imgs/user_default.png",
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 500,
        height: 300,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Scaffold(
              body: Column(
            children: [
              Row(
                children: [
                  MyFlatButton(
                    text: '微信好友',
                    img: 'imgs/wechat.png',
                    textColor: Colors.black54,
                    onPress: () => {
                      setState(() {
                        _selected = _selected == 0 ? -1 : 0;
                      })
                    },
                  ),
                  MyFlatButton(
                    text: 'qq好友',
                    img: 'imgs/qq.png',
                    textColor: Colors.black54,
                    onPress: () => {
                      setState(() {
                        _selected = _selected == 1 ? -1 : 1;
                      })
                    },
                  ),
                  MyFlatButton(
                    text: '好友',
                    img: 'imgs/send_friend.png',
                    textColor: Colors.black54,
                    onPress: () => {
                      setState(() {
                        _selected = _selected == 2 ? -1 : 2;
                      })
                    },
                  ),
                  MyFlatButton(
                    text: '复制链接',
                    img: 'imgs/link.png',
                    textColor: Colors.black54,
                    onPress: () => {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_selected != -1)
                    Image.asset(
                      imgs[_selected],
                      width: 150,
                      height: 150,
                    ),
                ],
              ),
            ],
          )),
        ));
  }
}
