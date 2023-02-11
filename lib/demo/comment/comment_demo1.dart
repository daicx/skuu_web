import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../pages/watchvideo/mytabbar_video.dart';
//nest scroll 图文评论demo
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: LookArticalPage1(),
    );
  }
}

class LookArticalPage1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LookArticalPage1();
  }
}

class _LookArticalPage1 extends State<LookArticalPage1>
    with SingleTickerProviderStateMixin {
  int contentLine = 4;
  bool hiddenRight = false;
  String? selectItemIndex;

  final List<String> items = [
    '热度',
    '正序',
    '倒序',
  ];

  @override
  void initState() {
    super.initState();
    selectItemIndex = items[0];
  }

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
        title: Text('详情'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(child: _getLeft()),
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

  Widget _getLeft() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                height: 80,
                color: Colors.primaries[index % 11],
              );
            },
            childCount: 5,
          )),
          SliverAppBar(
            backgroundColor: Colors.white,
            // automaticallyImplyLeading: false,
            pinned: true,
            title: Row(
              children: [
                TextButton(onPressed: () => {}, child: Text('全部回复')),
                TextButton(onPressed: () => {}, child: Text('只看楼主')),
                Spacer(),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Text(
                      '排序',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectItemIndex,
                    onChanged: (value) {
                      setState(() {
                        selectItemIndex = value as String;
                      });
                    },
                  ),
                ),
              ],
            ),
            // scrolledUnderElevation: 50,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.white,
                height: 10,
                // child: Row(),
              ),
            ),
          ),
        ];
      },
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 80,
            color: Colors.primaries[index % Colors.primaries.length],
            alignment: Alignment.center,
            child: Text(
              '$index',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }
}
