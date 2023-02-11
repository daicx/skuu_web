import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchItemV2 extends StatefulWidget {
  const SearchItemV2({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchItemV2();
  }
}

class _SearchItemV2 extends State<SearchItemV2>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollviewController;
  final List<String> _historys = [];
  final List<String> _hots = [];
  final _tabs = <String>['精选搜索', '今日特价', '发现更多'];

  @override
  void initState() {
    super.initState();
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _scrollviewController = ScrollController(initialScrollOffset: 0.0);
    _historys.addAll([
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
    ]);
    _hots.addAll([
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
      '综合1212',
    ]);
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
            expandedHeight: 900.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  ListTile(
                    title: Text(
                      "历史搜索",
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete_forever),
                      onPressed: () async {
                        final result = await showOkCancelAlertDialog(
                            context: context,
                            title: "清空搜索历史",
                            okLabel: "清空",
                            cancelLabel: "取消");
                        print(result.index);
                      },
                    ),
                  ),
                  Wrap(
                    spacing: 12.0, // 主轴(水平)方向间距
                    runSpacing: 1, // 纵轴（垂直）方向间距
                    alignment: WrapAlignment.start,
                    children: _historys
                        .map<Widget>((e) => GestureDetector(
                              child: Chip(
                                backgroundColor: Color(0xFFF5F5F5),
                                label: Text(
                                  e,
                                  style: TextStyle(
                                      color: Color(0xFF7C7070), fontSize: 13),
                                ),
                              ),
                              onTap: () {
                                setState(() {});
                              },
                            ))
                        .toList(),
                  ),
                  ListTile(
                    title: Text(
                      "搜索发现",
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: TextButton.icon(
                      icon: Icon(Icons.refresh),
                      onPressed: () {},
                      label: Text(
                        "换一换",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Wrap(
                    spacing: 12.0, // 主轴(水平)方向间距
                    runSpacing: 1, // 纵轴（垂直）方向间距
                    alignment: WrapAlignment.start,
                    children: _hots
                        .map<Widget>((e) => GestureDetector(
                              child: Chip(
                                backgroundColor: Color(0xFFF5F5F5),
                                label: Text(
                                  e,
                                  style: TextStyle(
                                      color: Color(0xFF7C7070), fontSize: 13),
                                ),
                              ),
                              onTap: () {
                                setState(() {});
                              },
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
            automaticallyImplyLeading: false,
            floating: true,
            snap: true,
            pinned: true,
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(color: Colors.amber),
            bottom: TabBar(
              controller: _tabController,
              tabs: _tabs.map((String name) => Tab(text: name)).toList(),
              labelColor: Colors.green,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((String name) {
          return Builder(
            builder: (BuildContext context) {
              return buildSliverList(count: _tabs.length, name: name);
            },
          );
        }).toList(),
      ),
    );
  }

  // 构建固定高度的SliverList，count为列表项属相
  Widget buildSliverList({int count = 5, String name = ""}) {
    return ListView.builder(
        itemCount: count,
        itemExtent: 50,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text(name + '$index'));
        });
  }
}
