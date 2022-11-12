import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchDefItem extends StatefulWidget {
  String content;

  SearchDefItem({this.content: ""});

  @override
  State<StatefulWidget> createState() {
    return _SearchDefItem();
  }
}

class _SearchDefItem extends State<SearchDefItem> {
  _SearchDefItem();

  final List<String> _historys = [];
  final List<String> _hots = [];
  final _tabs = <String>['精选搜索', '今日特价', '发现更多'];

  @override
  void initState() {
    super.initState();

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
  Widget build(BuildContext context) {
    // 构建 tabBar
    return DefaultTabController(
      length: _tabs.length, // This is the number of tabs.
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  expandedHeight: 250.h,
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
                                            color: Color(0xFF7C7070),
                                            fontSize: 13),
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
                                            color: Color(0xFF7C7070),
                                            fontSize: 13),
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
                  forceElevated: innerBoxIsScrolled,
                  backgroundColor: Colors.white,
                  titleTextStyle: TextStyle(color: Colors.amber),
                  bottom: TabBar(
                    tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: _tabs.map((String name) {
              return Builder(
                builder: (BuildContext context) {
                  return CustomScrollView(
                    controller: ScrollController(),
                    key: PageStorageKey<String>(name),
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.all(8.0),
                        sliver: buildSliverList(count: 20, name: name),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  // 构建固定高度的SliverList，count为列表项属相
  Widget buildSliverList({int count = 5, String name = ""}) {
    return SliverFixedExtentList(
      itemExtent: 50,
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListTile(title: Text(name + '$index'));
        },
        childCount: count,
      ),
    );
  }
}
