import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:skuu_web/constant/constant.dart';
import 'package:skuu_web/pages/friends/user_detail_page.dart';

import '../../bean/contact.dart';
import '../../component/azlist/az_common.dart';
import '../../component/azlist/az_listview.dart';
import '../../component/azlist/index_bar.dart';
import '../../route/routers.dart';
import '../../util/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: FriendsPage(),
    );
  }
}

//好友列表
class FriendsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FriendsPage();
  }
}

class _FriendsPage extends State<FriendsPage> {
  late List<String> _datas;
  String content = '测试赛';
  int indexSel = 1;
  String _selectedName = '';
  bool ignore = false;
  List<ContactInfo> contactList = [];
  List<ContactInfo> topList = [];

  @override
  void initState() {
    super.initState();
    _datas = [
      "发发发1",
      "发发发2",
      "发发发3",
      "发发发4",
      "发发发5",
      "发发发6",
      "发发发7",
      "发发发8",
      "发发发9",
      "发发发11",
    ];
    topList.add(ContactInfo(
        id: 12,
        name: '新的朋友',
        tagIndex: '↑',
        bgColor: Colors.orange,
        iconData: Icons.person_add));
    topList.add(ContactInfo(
        id: 13,
        name: '群聊',
        tagIndex: '↑',
        bgColor: Colors.green,
        iconData: Icons.people));
    topList.add(ContactInfo(
        id: 14,
        name: '标签',
        tagIndex: '↑',
        bgColor: Colors.blue,
        iconData: Icons.local_offer));
    topList.add(ContactInfo(
        id: 15,
        name: '公众号',
        tagIndex: '↑',
        bgColor: Colors.blueAccent,
        iconData: Icons.person));
    loadData();
  }

  void loadData() async {
    //加载联系人列表
    rootBundle.loadString('mock/contacts.json').then((value) {
      List list = json.decode(value);
      list.forEach((v) {
        contactList.add(ContactInfo.fromJson(v));
      });
      _handleList(contactList);
    });
  }

  void _handleList(List<ContactInfo> list) {
    if (list.isEmpty) return;
    _selectedName = list.first.name;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(contactList);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(contactList);

    // add topList.
    contactList.insertAll(0, topList);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Expanded(
        flex: 2,
        child: AzListView(
          data: contactList,
          itemCount: contactList.length,
          itemBuilder: (BuildContext context, int index) {
            ContactInfo model = contactList[index];
            return getWeChatListItem(context, model,
                defHeaderBgColor: Color(0xFFE5E5E5));
          },
          physics: BouncingScrollPhysics(),
          susItemBuilder: (BuildContext context, int index) {
            ContactInfo model = contactList[index];
            if ('↑' == model.getSuspensionTag()) {
              return Container();
            }
            return Utils.getSusItem(context, model.getSuspensionTag());
          },
          indexBarData: ['↑', '☆', ...kIndexBarData],
          indexBarOptions: IndexBarOptions(
            needRebuild: true,
            ignoreDragCancel: true,
            downTextStyle: TextStyle(fontSize: 12, color: Colors.white),
            downItemDecoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.green),
            indexHintWidth: 120 / 2,
            indexHintHeight: 100 / 2,
            indexHintDecoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Utils.getImgPath('ic_index_bar_bubble_gray')),
                fit: BoxFit.contain,
              ),
            ),
            indexHintAlignment: 1.sw > Constant.CHAT_TWO_VIEW_WIDTH
                ? Alignment.centerLeft
                : Alignment.centerRight,
            indexHintChildAlignment: Alignment(-0.25, 0.0),
            //指示器 偏移
            indexHintOffset: 1.sw > Constant.CHAT_TWO_VIEW_WIDTH
                ? Offset((1 / 7).sw, 0)
                : Offset(0, 0),
          ),
        ),
      ),
      if (1.sw > Constant.CHAT_TWO_VIEW_WIDTH)
        Expanded(
          flex: 5,
          child: UserDetailPage(
            indexSel,
          ),
        ),
    ]);
  }

  Widget getWeChatListItem(
    BuildContext context,
    ContactInfo model, {
    double susHeight = 40,
    Color? defHeaderBgColor,
  }) {
    return getWeChatItem(context, model, defHeaderBgColor: defHeaderBgColor);
  }

  Widget getWeChatItem(
    BuildContext context,
    ContactInfo model, {
    Color? defHeaderBgColor,
  }) {
    DecorationImage? image;
    return ListTile(
      selected: _selectedName == model.name,
      selectedTileColor: Constant.SELECT_COLOR,
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(4.0),
          color: model.bgColor ?? defHeaderBgColor,
          image: image,
        ),
        alignment: Alignment.center,
        child: model.iconData == null
            ? Text(
                PinyinHelper.getPinyinE(model.name)
                    .substring(0, 1)
                    .toUpperCase(),
                style: TextStyle(color: Colors.blue),
              )
            : Icon(
                model.iconData,
                color: Colors.white,
                size: 20,
              ),
      ),
      title: Text(model.name),
      onTap: () {
        setState(() {
          _selectedName = model.name;
          indexSel = model.id!;
        });
        if (1.sw < Constant.CHAT_TWO_VIEW_WIDTH)
          Routes.navigateTo(context, Routes.userDetail, params: {
            'userId': [indexSel.toString()]
          });
      },
    );
  }
}
