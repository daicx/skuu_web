import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MykuPage extends StatefulWidget {
  final int userId;

  const MykuPage({super.key, required this.userId});

  @override
  State<StatefulWidget> createState() {
    return _MykuPage();
  }
}

class _MykuPage extends State<MykuPage> {
  List<String> _items = <String>[];

  @override
  void initState() {
    super.initState();
    _items = [
      '我的工具',
      '我的工具',
      '我的工具',
      '我的工具',
      '我的工具',
      '我的工具',
      '我的工具',
      '我的工具',
    ];
  }

  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(color: Colors.green);
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            expandedHeight: 0.3.sh,
            pinned: true,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: IconButton(
                  iconSize: 50,
                  onPressed: () {},
                  icon: Image.asset('imgs/recharge.gif'),
                ),
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                '小金库',
                style: TextStyle(color: Colors.orange),
              ),
              background: Container(
                color: Colors.white,
                height: 0.3.sh - 50,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        'imgs/vip.svg',
                        height: 150,
                        width: 150,
                      ),
                      Container(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            '会员等级：99',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 25),
                          ),
                          Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          Text(
                            '认证：地产公司经理',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                            // overflow: TextOverflow.ellipsis,
                            // maxLines: 2,
                          ),
                          Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          const Text(
                            'U币：121个',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          const Text(
                            '累计消费：123个',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ];
      },
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 80,
            // color: Colors.primaries[index % Colors.primaries.length],
            alignment: Alignment.center,
            child: Text(
              _items[index] + '$index',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          );
        },
        itemCount: _items.length,
        separatorBuilder: (BuildContext context, int index) {
          return index % 2 == 0 ? divider1 : divider2;
        },
      ),
    );
  }
}
