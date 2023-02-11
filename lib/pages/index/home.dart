import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skuu_web/component/my_grid_view.dart';
import 'package:skuu_web/constant/constant.dart';
import 'package:skuu_web/pages/drawer_page.dart';
import 'package:skuu_web/pages/friends/user_detail_page.dart';
import 'package:skuu_web/pages/me/myku_page.dart';
import 'package:skuu_web/route/routers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../component/mybutton.dart';
import '../friends/chat_page_list.dart';
import '../friends/friends_page.dart';
import '../video/myvideo_long_item.dart';
import '../video/myvideo_short_item.dart';
import 'home_item_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'skuu';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  String imgPath = 'imgs/';

  late int _selected = 0;

  List<String> _tabTitle = [];

  late List<Widget> tabBoby;

  late TabController _controller;

  final controller = TextEditingController();

  void _changeIndex(int index) {
    setState(() {
      _selected = index;
      switch (_selected) {
        case 0:
          {
            _tabTitle = ['关注', '推荐', '热榜', '视频', '图片', '游戏', '小说', '问答'];
            tabBoby = [
              HomeItemPage(),
              HomeItemPage(),
              MyGridView(),
              MyGridView(),
              MyGridView(),
              MyGridView(),
              MyGridView(),
              MyGridView()
            ];
            break;
          }
        case 1:
          {
            _tabTitle = [
              '影视',
              '短视频',
            ];
            tabBoby = [
              // AppDeferredWidget(
              //   libraryLoader: myvideo_long_item.loadLibrary,
              //   builder: () => myvideo_long_item.MyVideoLongItem(),
              // ),
              MyVideoLongItem(),
              MyVideoShortItem(),
              // AppDeferredWidget(
              //   libraryLoader: myvideo_short_item.loadLibrary,
              //   builder: () => myvideo_short_item.MyVideoShortItem(),
              // ),
            ];
            break;
          }
        case 2:
          {
            _tabTitle = [
              '消息',
              '好友',
            ];
            tabBoby = [
              ChatPageList(),
              FriendsPage(),
              // AppDeferredWidget(
              //   libraryLoader: chat_page.loadLibrary,
              //   builder: () => chat_page.ChatPage(),
              // ),
              // AppDeferredWidget(
              //   libraryLoader: friends_page.loadLibrary,
              //   builder: () => friends_page.FriendsPage(),
              // ),
            ];
            break;
          }
        case 3:
          {
            _tabTitle = ['作品', 'UU库'];
            tabBoby = [
              UserDetailPage(12),
              MykuPage(userId: 12),
              // AppDeferredWidget(
              //   libraryLoader: myworks.loadLibrary,
              //   builder: () => myworks.MyWorks(),
              // ),
              // AppDeferredWidget(
              //   libraryLoader: myteams.loadLibrary,
              //   builder: () => myteams.MyTeams(),
              // ),
            ];
            break;
          }
      }
      _controller = TabController(
        length: _tabTitle.length,
        vsync: this,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _changeIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //导航栏
      appBar: _selected == 0
          ? AppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    child: Image.asset(
                      'imgs/hy.gif',
                    ),
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
              automaticallyImplyLeading: false,
              // centerTitle: false,
              title: InkWell(
                onTap: () {
                  Routes.navigateTo(context, Routes.searchPage);
                },
                child: Container(
                    width: 0.8.sw,
                    height: 40,
                    margin:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.w),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.search),
                        label: Text("英雄联盟手游"))),
              ),
              bottom: Constant.LOOK_MODE
                  ? null
                  : getTabBar(_tabTitle, tabBoby).keys.first,
              actions: [
                Container(
                  width: 100,
                  child: TextButton(
                    child: Text(
                      '京ICP备2022023998号',
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    onPressed: () {
                      _launchURL(
                          Uri(scheme: 'https', host: 'beian.miit.gov.cn'));
                    },
                  ),
                )
              ],
            )
          : AppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    child: Image.asset(
                      'imgs/hy.gif',
                    ),
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
              automaticallyImplyLeading: false,
              // centerTitle: false,
              title: getTabBar(_tabTitle, tabBoby).keys.first,
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Routes.navigateTo(context, Routes.searchPage);
                  },
                )
              ],
            ),
      drawer: const DrawerPage(),
      body: getTabBar(_tabTitle, tabBoby).values.first,
      floatingActionButton: GestureDetector(
              onDoubleTap: () {
                setState(() {
                  Constant.LOOK_MODE = !Constant.LOOK_MODE;
                });
              },
              onTap: () {},
              child: FloatingActionButton(
                onPressed: null,
                tooltip: '发布/双击切换浏览模式',
                child: const Icon(Icons.add),
              ),
            ),
      floatingActionButtonLocation: Constant.LOOK_MODE
          ? FloatingActionButtonLocation.endFloat
          : FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Constant.LOOK_MODE
          ? null
          : BottomAppBar(
              color: Colors.white,
              shape: const CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
              child: Row(
                children: [
                  MyFlatButton(
                    text: '首页',
                    img: _selected == 0
                        ? imgPath + 'index1_select.png'
                        : imgPath + 'index1.png',
                    textColor: _selected == 0 ? Colors.green : Colors.black54,
                    onPress: () => {_changeIndex(0)},
                  ),
                  MyFlatButton(
                    text: '影视',
                    img: _selected == 1
                        ? imgPath + 'video_select.png'
                        : imgPath + 'video.png',
                    textColor: _selected == 1 ? Colors.green : Colors.black54,
                    onPress: () => {_changeIndex(1)},
                  ),
                  SizedBox(
                  ),
                  MyFlatButton(
                    text: '消息',
                    img: _selected == 2
                        ? imgPath + 'msg_select.png'
                        : imgPath + 'msg.png',
                    textColor: _selected == 2 ? Colors.green : Colors.black54,
                    onPress: () => {_changeIndex(2)},
                  ),
                  MyFlatButton(
                    text: '我的',
                    img: _selected == 3
                        ? imgPath + 'me_select.png'
                        : imgPath + 'me.png',
                    textColor: _selected == 3 ? Colors.green : Colors.black54,
                    onPress: () => {_changeIndex(3)},
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
              ),
            ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //组装tab标题和内容
  Map<TabBar, Widget> getTabBar(List<String> _tabTitle, List<Widget> tabBoby) {
    return {
      TabBar(
        controller: _controller, //控制器
        indicatorSize: TabBarIndicatorSize.label,
        isScrollable: _tabTitle.length > 2 ? true : false,
        tabs: _tabTitle.map((e) {
          return Container(
            height: 120.h,
            width: 100.w,
            alignment: Alignment.center,
            child: Text(e),
          );
        }).toList(),
      ): Center(
        child: TabBarView(
          controller: _controller,
          physics: _selected == 2
              ? NeverScrollableScrollPhysics()
              : AlwaysScrollableScrollPhysics(), //禁止滑动
          children: tabBoby,
        ),
      )
    };
  }

  _launchURL(url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
