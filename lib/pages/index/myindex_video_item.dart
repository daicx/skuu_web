import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../component/level_icon.dart';
import '../../component/myshare_page.dart';
import '../../component/myvideo_play.dart';
import '../../route/routers.dart';

//首页-视频
class MyIndexVideoItem extends StatefulWidget {
  MyIndexVideoItem({this.id = 0});

  final int id;

  @override
  State<StatefulWidget> createState() {
    return _MyIndexVideoItem();
  }
}

class _MyIndexVideoItem extends State<MyIndexVideoItem> {
  late String name;
  bool _care = false;
  bool _zan = false;

  //网络请求,获取详情
  @override
  void initState() {
    super.initState();
    name = '视频作者';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'imgs/img_default.png',
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: AutoSizeText(
                            name,
                            style: TextStyle(fontSize: 20),
                            minFontSize: 10,
                            maxLines: 1,
                          ),
                        ),
                        LevelIcon(
                          lv: widget.id,
                        ),
                      ],
                    ),

                    Text(
                      '关注 32 KW  活跃 333 KW',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: <Widget>[
                    SizedBox(
                      width: 80,
                      height: 30,
                      child: ElevatedButton(
                        child: Text(
                          _care ? "已关注" : "+ 关注",
                          style: TextStyle(fontSize: 12),
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
              ],
            ),
            AutoSizeText(
              '  ' + '风萧萧兮易水寒，壮士一去兮不复还。',
              maxLines: 1,
              style: TextStyle(fontSize: 20),
              minFontSize: 10,
              stepGranularity: 10,
              overflow: TextOverflow.ellipsis,
            ),
            Container(
              height: 2,
              color: Colors.white,
            ),
            Expanded(
              flex: 9,
              child: AspectRatio(
                aspectRatio: 15 / 9,
                child: MyVideo(
                  url:
                      'https://cloud.video.taobao.com//play/u/153810888/p/2/e/6/t/1/395124651263.mp4',
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent)
                  ),
                  onPressed: () =>
                  {
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
                      backgroundColor: MaterialStateProperty.all(Colors.transparent)
                  ),
                  onPressed: () =>
                  {Routes.navigateTo(context, Routes.watch)},
                  icon: Icon(Icons.comment),
                  label: Text('评论'),
                ),
                MySharePage(),
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
    );
  }
}
