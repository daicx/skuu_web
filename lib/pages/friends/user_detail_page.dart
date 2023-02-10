import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skuu_web/pages/friends/friend_detail.dart';
import 'package:skuu_web/pages/video/myvideo_long_item.dart';

class UserDetailPage extends StatefulWidget {
  final int userId;

  UserDetailPage(this.userId, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _UserDetailPage();
  }
}

class _UserDetailPage extends State<UserDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollviewController;
  late PageController _pageController;
  final List<String> _pageViews = [];
  late int _curPageView = 0;
  bool _care = true;

  @override
  void initState() {
    super.initState();
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollviewController = ScrollController(initialScrollOffset: 0.0);
    _pageController = PageController();
    _pageViews.addAll([
      'imgs/defbak.png',
      'imgs/defbak1.png',
      'imgs/user_default.png',
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _scrollviewController.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        controller: _scrollviewController,
        headerSliverBuilder: (context, boxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              elevation: 0.5,
              forceElevated: true,
              expandedHeight: 0.5.sh,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin, //视差效果
                  background: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Container(
                            height: 0.3.sh,
                            child: _buildPageView(),
                          ),
                          _buildIndicator(),
                        ],
                      ),
                      Container(
                        color: Colors.white,
                        height: 0.2.sh - 50,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  'imgs/user_default.png',
                                ),
                              ),
                              Container(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {},
                                        child: AutoSizeText(
                                          '名称：' + widget.userId.toString(),
                                          style: const TextStyle(fontSize: 25),
                                          minFontSize: 10,
                                          overflow: TextOverflow.fade,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 2,
                                    color: Colors.white,
                                  ),
                                  const Text(
                                    '@Skuu.com',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  ),
                                  Container(
                                    height: 2,
                                    color: Colors.white,
                                  ),
                                  const Text(
                                    '关注 32 KW  活跃 333 KW',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
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
                        ),
                      ),
                    ],
                  )),
              bottom: TabBar(
                  indicatorColor: Colors.grey,
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: false,
                  tabs: [
                    Tab(
                      text: "首页",
                    ),
                    Tab(
                      text: "视频",
                    ),
                    Tab(
                      text: "播放列表",
                    ),
                    Tab(
                      text: "简介",
                    )
                  ]),
            ),
          ];
        },
        body: TabBarView(controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
          MyVideoLongItem(),
          MyVideoLongItem(),
          MyVideoLongItem(),
          FriendDetail(
            title: '名称：' + widget.userId.toString(),
          ),
        ]));
  }

  Widget _buildPageView() {
    var length = _pageViews.length;
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _curPageView = index;
        });
      },
      itemCount: length,
      itemBuilder: (context, index) {
        return Image.asset(
          _pageViews[index],
          fit: BoxFit.cover,
        );
      },
    );
  }

  Widget _buildIndicator() {
    return Positioned(
      bottom: 10,
      child: Row(
        children: _pageViews.map((s) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: ClipOval(
              child: Container(
                width: 8,
                height: 8,
                color: _pageViews.indexOf(s) == _curPageView
                    ? Colors.white
                    : Colors.grey,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
