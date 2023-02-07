import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../route/routers.dart';
import '../../component/myshare_page.dart';
import '../../component/myvideo_play.dart';

class MyVideoVideoItem extends StatefulWidget {
  MyVideoVideoItem({this.id = 0});

  final int id;

  @override
  State<StatefulWidget> createState() {
    return _MyVideoVideoItem();
  }
}

class _MyVideoVideoItem extends State<MyVideoVideoItem> {
  late String name;
  double hover = 0;
  double imgHover = 60;
  bool _care = false;
  bool _zan = false;
  final List<String> _items = [];

  //网络请求,获取详情
  @override
  void initState() {
    super.initState();
    name = "新世界";
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
      body: Padding(
        padding: EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio: 15 / 9,
                child: MyVideo(
                  url:
                  'https://cloud.video.taobao.com//play/u/153810888/p/2/e/6/t/1/266102583124.mp4',
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: 130,
              child: Row(
                children: <Widget>[
                  InkWell(
                    onHover: (a) {},
                    onTap: () => {},
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'imgs/img_default.png',
                          width: imgHover,
                          height: imgHover,
                        ),
                        SizedBox(
                          width: 80,
                          height: 30,
                          child: ElevatedButton(
                            child: Text(
                              _care ? "已关注" : "+ 关注",
                              style: const TextStyle(fontSize: 12),
                            ),
                            onPressed: () {
                              setState(() {
                                _care = !_care;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(width: 5,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '长风破浪长风破浪长风222,破浪长风破浪长风破浪破浪长风破浪破浪长风破浪破浪长风破浪长风破浪',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                        Row(children: [
                          InkWell(
                            onHover: (a) {},
                            onTap: () => {},
                            child: Row(
                              children: <Widget>[
                                Text(
                                  name,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10),
                                  overflow: TextOverflow.ellipsis,
                                  textScaleFactor: 1.5,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              ' ◉ 1212 次观看  ◉ 2天前',
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 10),
                            ),
                          ),
                        ],),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: <Widget>[
                              TextButton.icon(
                                style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(
                                        Colors.transparent)),
                                onPressed: () => {
                                  setState(() {
                                    _zan = !_zan;
                                  })
                                },
                                icon: _zan
                                    ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                                    : Icon(Icons.favorite_border),
                                label: Text(_zan ? '取消' : '喜欢'),
                              ),
                              TextButton.icon(
                                style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(
                                        Colors.transparent)),
                                onPressed: () => {
                                  Routes.navigateTo(
                                      context, Routes.whatArticle)
                                },
                                icon: Icon(Icons.comment),
                                label: Text('评论'),
                              ),
                              MySharePage(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[

                      Spacer(),
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
                            PopupMenuItem<String>(
                              value: '2',
                              child: Text('不感兴趣'),
                            ),
                            PopupMenuItem<String>(
                              value: '3',
                              child: Text('加入播放队列'),
                            ),
                          ];
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
