import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skuu_web/component/my_grid_view.dart';
import 'package:skuu_web/pages/drawer_page.dart';
import 'package:skuu_web/route/routers.dart';

import '../../component/mybutton.dart';

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
              MyGridView(),
              MyGridView(),
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
              '关注',
              '推荐',
            ];
            tabBoby = [MyGridView(), MyGridView()];
            break;
          }
        case 2:
          {
            _tabTitle = [
              '关注',
              '推荐',
            ];
            tabBoby = [];
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
                  return SizedBox(
                    width: 10.w,
                    height: 10.h,
                    child: GestureDetector(
                      child: Image.asset(
                        'imgs/img_default.png',
                      ),
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
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
                    width: 330.w,
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
              bottom: getTabBar(_tabTitle, tabBoby).keys.first,
            )
          : AppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                    width: 10.w,
                    height: 10.h,
                    child: GestureDetector(
                      child: Image.asset(
                        'imgs/img_default.png',
                      ),
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: '发布',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
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
            SizedBox(), //中间位置空出
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
        tabs: _tabTitle.map((e) {
          return Container(
            height: 50,
            width: 80,
            alignment: Alignment.center,
            child: Text(e),
          );
        }).toList(),
      ): Center(
        child: TabBarView(
          controller: _controller,
          children: tabBoby,
        ),
      )
    };
  }
}
