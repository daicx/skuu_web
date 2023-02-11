import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/constant.dart';
import 'level_icon.dart';
import 'mybutton.dart';

void main() => runApp(MyApp());

//发表作品 页面
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: CommengSecondItem(),
    );
  }
}

class CommengSecondItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CommengSecondItem();
  }
}

class _CommengSecondItem extends State<CommengSecondItem> {
  int _selected = -1;
  List<String> imgs = [];
  String text =
      '在十几二十岁的年纪遇见了你成为了我最喜欢的那个女孩，对我来说就是上天赐予我最好的礼物。我真的很喜欢你这个让我看一眼就会笑的女孩子，只靠爱情是不可能在一起辈子的，白头偕老需要的很多，成为情侣可能只需要爱情，但成为家人需要是我们两个人厮守到老，不仅仅要靠爱情更多的是习惯与责任。想和你走到最后，我会口是心非但我想让你看透我的心，我生气也好冷战也罢，这只能证明我爱你，我会故意气气你会粘着你会和你吵架，但是不会轻易离开你，我会管着你但不想失去你。';

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
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent)),
      onPressed: () => {
        showModalBottomSheet(
            constraints: BoxConstraints(maxHeight: 0.9.sh),
            context: context,
            isScrollControlled: true,
            builder: (BuildContext build) {
              return ListView(
                children: [
                  getRow(1),
                  getRow(1),
                  getRow(1),
                  getRow(1),
                ],
              );
            })
      },
      child: Text('查看全部30挑评论'),
    );
  }

  Widget getRow(int i) {
    return ListTile(
      hoverColor: Colors.white,
      focusColor: Colors.white,
      leading: Image.asset(
        'imgs/defbak.png',
        width: Constant.HEAD_IMG_SEZE,
        height: Constant.HEAD_IMG_SEZE,
        fit: BoxFit.fill,
      ),
      title: Container(
        padding: EdgeInsets.only(top: 10),
        decoration: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.black12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(child: Text('新飞飞')),
                LevelIcon(
                  lv: 5,
                ),
                Spacer(),
                Image.asset(
                  'imgs/zan.png',
                  width: 50,
                  height: 30,
                ),
                Text('212'),
                PopupMenuButton(
                  tooltip: "更多",
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.black54,
                  ),
                  onSelected: (va) {
                    print(va);
                  },
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: '0',
                        child: Text('收藏'),
                      ),
                      PopupMenuItem<String>(
                        value: '1',
                        child: Text('举报'),
                      ),
                    ];
                  },
                ),
              ],
            ),
            SelectableText(text),
            SizedBox(
              height: 5,
            ),
            Text(
              '2022-12-11 10：12',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {});
      },
    );
  }
}
