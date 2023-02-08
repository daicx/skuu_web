// import 'package:adaptive_dialog/adaptive_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class UserDetailPage extends StatefulWidget {
//   String content;
//
//   UserDetailPage({this.content: ""});
//
//   @override
//   State<StatefulWidget> createState() {
//     return _UserDetailPage();
//   }
// }
//
// class _UserDetailPage extends State<UserDetailPage> {
//   _UserDetailPage();
//
//   final List<String> _historys = [];
//   final List<String> _hots = [];
//   final _tabs = <String>['精选搜索', '今日特价', '发现更多'];
//
//   @override
//   void initState() {
//     super.initState();
//
//     _historys.addAll([
//       '综合1212',
//       '综合1212',
//       '综合1212',
//       '综合1212',
//       '综合1212',
//       '综合1212',
//       '综合1212',
//       '综合1212',
//       '综合1212',
//     ]);
//     _hots.addAll([
//       '综合1212',
//       '综合1212',
//       '综合1212',
//       '综合1212',
//       '综合1212',
//       '综合1212',
//       '综合1212',
//       '综合1212',
//     ]);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // 构建 tabBar
//     return NestedScrollView(
//       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//         return <Widget>[
//           SliverAppBar(
//             expandedHeight: 230.0,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text('复仇者联盟'),
//               background: Image.network(
//                 'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
//                 fit: BoxFit.fitHeight,
//               ),
//             ),
//             bottom: TabBar(
//               tabs: _tabs.map((String name) => Tab(text: name)).toList(),
//             ),
//           )
//         ];
//       },
//       body: TabBarView(
//         children: _tabs.map((String name) {
//           return Builder(
//             builder: (BuildContext context) {
//               return CustomScrollView(
//                 key: PageStorageKey<String>(name),
//                 slivers: <Widget>[
//                   SliverOverlapInjector(
//                     handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//                   ),
//                   SliverPadding(
//                     padding: const EdgeInsets.all(8.0),
//                     sliver: buildSliverList(50),
//                   ),
//                 ],
//               );
//             },
//           );
//         }).toList(),
//       ),
//     );
//   }
//
//   // 构建固定高度的SliverList，count为列表项属相
//   Widget buildSliverList({int count = 5, String name = ""}) {
//     return SliverFixedExtentList(
//       itemExtent: 50,
//       delegate: SliverChildBuilderDelegate(
//         (context, index) {
//           return ListTile(title: Text(name + '$index'));
//         },
//         childCount: count,
//       ),
//     );
//   }
// }
