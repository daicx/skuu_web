import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../route/routers.dart';
import 'myshare_page.dart';
import 'myvideo_play.dart';

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
  double imgHover = 50;
  bool _care = false;
  bool _zan = false;
  final List<String> _items = [];

  //网络请求,获取详情
  @override
  void initState() {
    super.initState();
    name = "而且大都";
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
        padding: EdgeInsets.only(top: 15),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white)),
          onPressed: () {
            Routes.navigateTo(context, Routes.watch);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                // flex: 9,
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
                      hoverColor: Colors.black12,
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
                          InkWell(
                            hoverColor: Colors.black12,
                            onHover: (a) {},
                            onTap: () => {},
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    name,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10),
                                    overflow: TextOverflow.ellipsis,
                                    textScaleFactor: 1.5,
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
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                TextButton.icon(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white)),
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
                                  label: Text(_zan ? '取消' : '收藏'),
                                ),
                                TextButton.icon(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white)),
                                  onPressed: () => {
                                    Routes.navigateTo(
                                        context, Routes.whatArticle)
                                  },
                                  icon: Icon(Icons.comment),
                                  label: Text('评论'),
                                ),
                                TextButton.icon(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white)),
                                  onPressed: () => {
                                    showModalBottomSheet(
                                        constraints:
                                            BoxConstraints(maxHeight: 80.h),
                                        context: context,
                                        builder: (BuildContext build) {
                                          return Center(child: MySharePage());
                                        })
                                  },
                                  icon: Icon(Icons.share),
                                  label: Text('分享'),
                                ),
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
                                child: Text('下载'),
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
}
