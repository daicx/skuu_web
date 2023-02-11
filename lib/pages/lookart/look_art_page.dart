import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../component/comment_second_item.dart';
import '../../component/level_icon.dart';
import '../../constant/constant.dart';
import '../../pages/watchvideo/mytabbar_video.dart';

class LookArticalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LookArticalPage();
  }
}

class _LookArticalPage extends State<LookArticalPage>
    with SingleTickerProviderStateMixin {
  int contentLine = 4;
  bool hiddenRight = false;
  String? selectItemIndex;
  int selectRange = 1;
  String text =
      '在十几二十岁的年纪遇见了你成为了我最喜欢的那个女孩，对我来说就是上天赐予我最好的礼物。我真的很喜欢你这个让我看一眼就会笑的女孩子，只靠爱情是不可能在一起辈子的，白头偕老需要的很多，成为情侣可能只需要爱情，但成为家人需要是我们两个人厮守到老，不仅仅要靠爱情更多的是习惯与责任。想和你走到最后，我会口是心非但我想让你看透我的心，我生气也好冷战也罢，这只能证明我爱你，我会故意气气你会粘着你会和你吵架，但是不会轻易离开你，我会管着你但不想失去你。';

  final List<String> items = [
    '热度',
    '正序',
    '倒序',
  ];
  bool ifInputing = false;

  final searchController = TextEditingController();

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
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: ifInputing == true
          ? SizedBox(
              width: hiddenRight ? 1.sw - 400 : 1.sw-30,
              height: 100,
              child: TextField(
                maxLines: 100,
                controller: searchController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: '评论',
                  border: InputBorder.none,
                  suffix: Column(
                    children: [
                      TextButton(
                          onPressed: () => {
                                setState(() {
                                  ifInputing = false;
                                })
                              },
                          child: Text('发表')),
                      TextButton(
                          onPressed: () => {
                                setState(() {
                                  ifInputing = false;
                                })
                              },
                          child: Text('取消')),
                    ],
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDCDFE6)),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF409EFF)),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                onChanged: (a) {
                  setState(() {});
                },
              ),
            )
          : FloatingActionButton(
              onPressed: () => {
                setState(() {
                  ifInputing = true;
                })
              },
              child: Text('评论'),
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
              if (index == 0) return SelectableText.rich(TextSpan(text: text));
              return Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Image.asset(
                    'imgs/defbak.png',
                    fit: BoxFit.fill,
                  ));
            },
            childCount: 5,
          )),
          SliverAppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            pinned: true,
            title: Row(
              children: [
                TextButton(
                  onPressed: () => {
                    setState(() {
                      selectRange = -selectRange;
                    })
                  },
                  child: Text('全部回复',
                      style: TextStyle(
                          color: selectRange == 1 ? Colors.blue : Colors.grey)),
                ),
                TextButton(
                  onPressed: () => {
                    setState(() {
                      selectRange = -selectRange;
                    })
                  },
                  child: Text('只看楼主',
                      style: TextStyle(
                          color:
                              selectRange == -1 ? Colors.blue : Colors.grey)),
                ),
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
          return getRow(index);
        },
        itemCount: 3,
      ),
    );
  }

  Widget getRow(int i) {
    return ListTile(
      hoverColor: Colors.white,
      focusColor: Colors.white,
      leading: Image.asset(
        'imgs/defbak.png',
        width: Constant.HEAD_IMG_SEZE,
        height: Constant.HEAD_IMG_SEZE,
        fit: BoxFit.fill,
      ),
      title: Container(
        padding: EdgeInsets.only(top: 10),
        decoration: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.black12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(child: Text('新飞飞')),
                LevelIcon(
                  lv: 5,
                ),
                Spacer(),
                Image.asset(
                  'imgs/zan.png',
                  width: 50,
                  height: 30,
                ),
                Text('212'),
                PopupMenuButton(
                  tooltip: "更多",
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.black54,
                  ),
                  onSelected: (va) {
                    print(va);
                  },
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: '0',
                        child: Text('收藏'),
                      ),
                      PopupMenuItem<String>(
                        value: '1',
                        child: Text('举报'),
                      ),
                    ];
                  },
                ),
              ],
            ),
            SelectableText(text),
            SizedBox(
              height: 5,
            ),
            Text(
              '第$i楼  2022-12-11 10：12',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: Constant.SELECT_COLOR,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('新飞飞1：', style: TextStyle(color: Colors.grey)),
                      Expanded(
                        child: SelectableText(text),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('新飞飞1：', style: TextStyle(color: Colors.grey)),
                      Expanded(
                        child: SelectableText(text),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('新飞飞1：', style: TextStyle(color: Colors.grey)),
                      Expanded(
                        child: SelectableText(text),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('新飞飞1：', style: TextStyle(color: Colors.grey)),
                      Expanded(
                        child: SelectableText(text),
                      )
                    ],
                  ),
                  // TextButton(onPressed: ()=>{}, child: Text('查看全部30挑评论')),
                  CommengSecondItem(),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {});
      },
    );
  }
}
