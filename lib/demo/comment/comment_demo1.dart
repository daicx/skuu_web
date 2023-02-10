import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skuu_web/pages/watchvideo/component_item.dart';

import '../../component/myvideo_play.dart';
import '../../pages/watchvideo/mytabbar_video.dart';

class lookArticalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _lookArticalPage();
  }
}

class _lookArticalPage extends State<lookArticalPage> {
  int contentLine = 4;
  bool hiddenRight = false;
  bool _care = false;

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    if (wid < 900) {
      hiddenRight = false;
    } else {
      hiddenRight = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('视频播放'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                child: left(),
              ),
            ),
            if (hiddenRight)
              SizedBox(
                width: 20,
              ),
            if (hiddenRight)
              Container(
                width: 350,
                height: double.infinity,
                child: MyTabBarVideo(),
              ),
          ],
        ),
      ),
    );
  }

  Widget left() {
    return SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 10,
              child: MyVideo(
                url:
                'https://cloud.video.taobao.com//play/u/153810888/p/2/e/6/t/1/266102583124.mp4',
                color: Colors.black,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '妹子跟小伙在海里撒尿，哇，热乎乎的！韩国爆笑电影《海盗》',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    '5,509次观看 • 2020年6月12日',
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.share),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset(
                      'imgs/img_default.png',
                      width: 60,
                      height: 60,
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
                          child: Text(
                            '哒哒哒哒',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                            // textScaleFactor: 1.5,
                          ),
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
                      '粉丝 32 KW ',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black87, fontSize: 15),
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
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '《死路》讲述了一家人在圣诞前夕经历一场恐怖遭遇的故事。别忘点击订阅，'
                      '打开小铃铛哦~加入频道会员，每周抢先观看2集未发布视频微信公众号：'
                      '宇哥讲电影（求大家关注商务合作，请加微信yimingfirstfacebook主页：'
                      'https://www.facebook.com/yugemv/',
                  style: TextStyle(fontSize: 15),
                  maxLines: contentLine,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: Container(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      contentLine = contentLine == 4 ? 5 : 4;
                    });
                  },
//              hoverColor: ,
                  child: Text(contentLine == 4 ? '展开' : '收起'),
                ),
              ),
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            if (!hiddenRight)
              Container(
                height: 1.sh - 60,
                child: MyTabBarVideo(),
              )
          ],
        ));
  }
}
