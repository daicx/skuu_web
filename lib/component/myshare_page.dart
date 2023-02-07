import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return TextButton.icon(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.transparent)),
      onPressed: () => {
        showModalBottomSheet(
            constraints: BoxConstraints(maxHeight: 350.h),
            context: context,
            builder: (BuildContext build) {
              return Center(
                  child: SizedBox(
                width: 1.sw,
                height: 350.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
              ));
            })
      },
      icon: Icon(Icons.share),
      label: Text('分享'),
    );
  }
}
