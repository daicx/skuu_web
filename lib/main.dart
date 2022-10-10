import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skuu_web/component/my_grid_view.dart';
import 'package:skuu_web/pages/drawer_page.dart';
import 'package:skuu_web/route/routers.dart';

void main() {
  FluroRouter router = new FluroRouter();
  Routes.configureRoutes(router);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'SKUU',
          // debugShowCheckedModeBanner: true,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'skuu';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late int _selected;

  List<String> _tabTitle = [];

  late List<Widget> tabBoby;

  late TabController _controller;

  final controller = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //导航栏
      appBar: AppBar(
          // title: Text(widget.title),
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
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.w),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.search),
                    label: Text("英雄联盟手游"))),
          )),
      drawer: const DrawerPage(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
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

  void _changeIndex(int index) {
    setState(() {
      _selected = index;
      switch (_selected) {
        case 0:
          {
            _tabTitle = [
              '关注',
              '推荐',
            ];
            tabBoby = [MyGridView(), MyGridView()];
            break;
          }
        case 1:
          {
            _tabTitle = [
              '兔视',
              '兔影',
            ];
            tabBoby = [
              MyGridView(),
              MyGridView(),
            ];
            break;
          }
        case 2:
          {
            _tabTitle = [
              '会话',
              '好友列表',
            ];
            tabBoby = [
              MyGridView(),
              MyGridView(),
            ];
            break;
          }
        case 3:
          {
            _tabTitle = ['作品', '兔窝'];
            tabBoby = [
              MyGridView(),
              MyGridView(),
            ];
            break;
          }
      }
    });
    //是否重置
//    _controller.animateTo(0,duration: Duration(milliseconds: 0));
  }
}
