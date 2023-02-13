import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skuu_web/constant/constant.dart';
import 'package:skuu_web/pages/watchvideo/component_item.dart';
import 'package:skuu_web/pages/watchvideo/wait_play_video_list.dart';

import 'mytabbar_video.dart';
import '../../component/myvideo_play.dart';

class PlayVideoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlayVideoPage();
  }
}

class _PlayVideoPage extends State<PlayVideoPage>
    with TickerProviderStateMixin {
  int contentLine = 4;
  bool hiddenRight = false;
  bool _care = false;
  late List<String> _tabs = <String>['详情', '接下来播放'];

  String text =
      '在十几二十岁的年纪遇见了你成为了我最喜欢的那个女孩，对我来说就是上天赐予我最好的礼物。我真的很喜欢你这个让我看一眼就会笑的女孩子，只靠爱情是不可能在一起辈子的，白头偕老需要的很多，成为情侣可能只需要爱情，但成为家人需要是我们两个人厮守到老，不仅仅要靠爱情更多的是习惯与责任。想和你走到最后，我会口是心非但我想让你看透我的心，我生气也好冷战也罢，这只能证明我爱你，我会故意气气你会粘着你会和你吵架，但是不会轻易离开你，我会管着你但不想失去你。';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    if (wid < 900) {
      hiddenRight = true;
      _tabs = <String>['详情', '接下来播放'];
    } else {
      hiddenRight = false;
      _tabs = <String>['详情'];
    }
    // _tabController = TabController(length: _tabs.length, vsync: this);

    return Scaffold(
      appBar: AppBar(
        title: Text('视频播放'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: DefaultTabController(
                length: _tabs.length,
                child: getLeft(),
              ),
              // child: getLeft(),
            ),
            if (!hiddenRight)
              SizedBox(
                width: 20,
              ),
            if (!hiddenRight)
              Container(
                width: 350,
                height: 1.sh,
                child: MyTabBarVideo(),
              ),
          ],
        ),
      ),
    );
  }

  Widget getLeft() {
    return NestedScrollView(
        headerSliverBuilder: (context, boxIsScrolled) {
          return [
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 0)
                  return AspectRatio(
                    aspectRatio: 16 / 10,
                    child: MyVideo(
                      url:
                          'https://cloud.video.taobao.com//play/u/153810888/p/2/e/6/t/1/266102583124.mp4',
                      color: Colors.black,
                    ),
                  );
                if (index == 1)
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '妹子跟小伙在海里撒尿，哇，热乎乎的！韩国爆笑电影《海盗》',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                if (index == 2)
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          '5,509次观看 • 2020年6月12日',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                        Spacer(),
                        if (hiddenRight)
                          IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    constraints:
                                        BoxConstraints(maxHeight: 0.9.sh),
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (BuildContext build) {
                                      return ComponentItem();
                                    });
                              },
                              icon: SvgPicture.asset(
                                  width: 40, height: 40, 'imgs/danmu.svg')),
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
                  );
              },
              childCount: 3,
            )),
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: Constant.SELECT_COLOR,
              title: TabBar(
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: _tabs
                      .map((e) => Tab(
                            text: e,
                          ))
                      .toList()),
            ),
          ];
        },
        body: TabBarView(children: [
          ListView(
            children: [
              ListTile(
                leading: Image.asset(
                  'imgs/img_default.png',
                  width: 60,
                  height: 60,
                ),
                title: Column(
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
                    ),
                    Text(
                      '粉丝 32 KW ',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black87, fontSize: 15),
                    ),
                    Container(
                      height: 2,
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ],
                ),
                trailing: ElevatedButton(
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
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: SelectableText.rich(TextSpan(text: text)),
              ),
              SelectableText.rich(TextSpan(text: text)),
              SelectableText.rich(TextSpan(text: text)),
              SelectableText.rich(TextSpan(text: text)),
              SelectableText.rich(TextSpan(text: text)),
            ],
          ),
          if (hiddenRight)
            WaitPlayVideoList(
              title: '',
            ),
        ]));
  }
}
