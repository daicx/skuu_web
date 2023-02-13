import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: NestedScrollViewDemo1(),
    );
  }
}

class NestedScrollViewDemo1 extends StatefulWidget {
  const NestedScrollViewDemo1({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NestedScrollViewDemo1();
  }
}

class _NestedScrollViewDemo1 extends State<NestedScrollViewDemo1>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollviewController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollviewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _scrollviewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    // 生成 6 个 Tab 页
    for (int i = 0; i < 6; ++i) {
      children.add(Container(
        height: 300.0,
        // width: 420,
        color: Colors.blue,
        child: Image.asset(
          "imgs/defbak.png",
          fit: BoxFit.fitWidth,
        ),
      ));
    }
    return NestedScrollView(
        controller: _scrollviewController,
        headerSliverBuilder: (context, boxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              elevation: 0.5,
              forceElevated: true,
              //backgroundColor: Colors.grey,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin, //视差效果
                background: PageView(
                  children: children,
                ),
              ),
              bottom: TabBar(controller: _tabController, tabs: [
                Tab(
                  text: "首页",
                ),
                Tab(
                  text: "消息",
                ),
                Tab(
                  text: "购物",
                ),
                Tab(
                  text: "我的",
                )
              ]),
            ),
          ];
        },
        body: TabBarView(controller: _tabController,
            children: [
          Center(
            child: Text("one"),
          ),
          Center(
            child: Text("two"),
          ),
          Center(
            child: Text("three"),
          ),
          Center(
            child: Text("four"),
          ),
        ]));
  }
}
