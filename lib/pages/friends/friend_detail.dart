import 'package:flutter/material.dart';

class FriendDetail extends StatelessWidget {
  final String title;

  FriendDetail({required this.title});

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery
        .of(context)
        .size
        .width;
    if (wid < 700) {
      return Scaffold(
        appBar: AppBar(
          title: Text('用户详情'),
          actions: [
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.more_horiz,
                ))
          ],
        ),
        body: getContent(),
      );
    } else {
      return getContent();
    }
  }

  Widget getContent() {
    return
      Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Text(
                            title,
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ),
                          Image.asset(
                            'imgs/img_default.png',
                            width: 30,
                            height: 30,
                          ),
                        ],
                      ),
                      Text(
                        '新人类文明',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.grey, fontSize: 21),
                      ),
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    'imgs/user_default.png',
                    fit: BoxFit.fill,
                    width: 150,
                    height: 150,
                  )
                ],
              ),
              Container(
                color: Colors.grey,
                margin: EdgeInsets.only(top: 10),
                height: 1,
              ),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(children: [
                    Text(
                      '备注',
                      style: TextStyle(fontSize: 21),
                    ),
                    Text(
                      '哒哒哒哒',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                      '地区',
                      style: TextStyle(fontSize: 21),
                    ),
                    Text(
                      '北京-海淀',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                      'skuu号',
                      style: TextStyle(fontSize: 21),
                    ),
                    Text(
                      'sk-001',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                      '来源',
                      style: TextStyle(fontSize: 21),
                    ),
                    Text(
                      '手机号添加',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                  ]),
                ],
              ),
              Container(
                color: Colors.grey,
                margin: EdgeInsets.only(top: 10),
                height: 1,
              ),
              ElevatedButton(
                child: Text(
                  '发消息',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => {},
              ),
            ],
          )
      );
  }
}
