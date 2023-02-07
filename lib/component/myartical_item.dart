import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyArticalItem extends StatefulWidget {
  MyArticalItem({this.id = 0});

  final int id;

  @override
  State<StatefulWidget> createState() {
    return _MyArticalItem();
  }
}

class _MyArticalItem extends State<MyArticalItem> {
  late String name;
  late Color click;
  final List<String> _items = [];

  //网络请求,获取详情
  @override
  void initState() {
    super.initState();
    name = "新飞飞";
    _items.addAll([
      '1',
      '1',
      '1',
      '1',
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset(
                  'imgs/img_default.png',
                  width: 48,
                  height: 48,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      name,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 11),
                      textScaleFactor: 1.5,
                    ),
                    Image.asset(
                      'imgs/img_default.png',
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
                Container(
                  height: 2,
                  color: Colors.white,
                ),
                Text(
                  '关注 32 KW  活跃 333 KW',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 4),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.exit_to_app),
              iconSize: 20,
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: InkWell(
        hoverColor: Colors.green,
        onHover: (a) {},
        onTap: () {},
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('imgs/room.png'), fit: BoxFit.fill)),
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 20, top: 20),
            child: Text(
              '长风破浪长风破浪长风,破浪长风破浪蓉长风破浪蓉长风破浪蓉长风破浪长风破浪长风破浪',
              maxLines: 4,
              style: TextStyle(fontSize: 17, color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }

  int getCount(int count) {
    if (count <= 3) {
      return count;
    } else {
      return 3;
    }
  }

  double getRatio(int count) {
    if (count == 1) {
      return 5 / 3;
    } else if (count == 2) {
      return 1;
    } else {
      return 1;
    }
  }
}
