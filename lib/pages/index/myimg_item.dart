import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skuu_web/constant/constant.dart';

import '../../component/level_icon.dart';
import '../../component/myshare_page.dart';
import '../../route/routers.dart';

//首页--图片
class MyImgItem extends StatefulWidget {
  const MyImgItem({super.key, this.id = 0});

  final int id;

  @override
  State<StatefulWidget> createState() {
    return _MyImgItem();
  }
}

class _MyImgItem extends State<MyImgItem> {
  late String name;
  late Color click;
  final List<String> _items = [];
  bool _care = false;
  bool _zan = false;
  late int length;

  //网络请求,获取详情
  @override
  void initState() {
    super.initState();
    name = "新飞飞";
    length = widget.id;
    _items.addAll([
      // '1',
      // '1',
      '1',
      '1',
    ]);
    _care = Random.secure().nextBool();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'imgs/img_default.png',
                    width: Constant.HEAD_IMG_SEZE,
                    height: Constant.HEAD_IMG_SEZE,
                  ),
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
                            style: const TextStyle(fontSize: 20),
                            minFontSize: 10,
                            maxLines: 1,
                          ),
                        ),
                        LevelIcon(lv: Random().nextInt(11)),
                      ],
                    ),
                    Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    const Text(
                      '关注 32 KW  活跃 333 KW',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: <Widget>[
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
              ],
            ),
            const AutoSizeText(
              '  ' + '长风破浪会有时，直挂云帆济沧海。',
              maxLines: 1,
              style: TextStyle(fontSize: 20),
              minFontSize: 10,
              stepGranularity: 10,
              overflow: TextOverflow.ellipsis,
            ),
            if (length > 0)
              Expanded(
                // flex: 9,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    Routes.navigateTo(context, Routes.whatArticle);
                  },
                  child: Container(
                    child: GridView.builder(
                        padding: EdgeInsets.only(top: 2.0),
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: getCount(length),
                            childAspectRatio: 1,
                            mainAxisSpacing: 2.0,
                            crossAxisSpacing: 2.0),
                        itemCount: length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            'imgs/defbak.png',
                            fit: BoxFit.fill,
                          );
                        }),
                  ),
                ),
              ),
            // Expanded(
            //   // flex: 1,
            //   child:
            // )
            Row(
              children: <Widget>[
                TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent)),
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
                  label: Text(_zan ? '取消' : '点赞'),
                ),
                TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent)),
                  onPressed: () =>
                      {Routes.navigateTo(context, Routes.whatArticle)},
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

  int getCount(int count) {
    if (count <= 3) {
      return count;
    } else {
      return 3;
    }
  }
}
