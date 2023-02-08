// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void main(){
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Material",
//       home: NestedScrollViewDemo1(),
//     );
//   }
// }
//
// class NestedScrollViewDemo1 extends StatefulWidget {
//   const NestedScrollViewDemo1({super.key});
//
//   @override
//   State<StatefulWidget> createState() {
//     return _NestedScrollViewDemo1();
//   }
// }
//
// class _NestedScrollViewDemo1 extends State<NestedScrollViewDemo1> {
//   @override
//   Widget build(BuildContext context) {
//     return NestedScrollView(
//       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//         return <Widget>[
//           SliverAppBar(
//             expandedHeight: 230.0,
//             pinned: true,
//             flexibleSpace: Padding(
//               padding: EdgeInsets.symmetric(vertical: 8),
//               child: PageView(),
//             ),
//           ),
//           SliverPersistentHeader(
//             pinned: true,
//             delegate: StickyTabBarDelegate(
//               child: TabBar(
//                 labelColor: Colors.black,
//                 controller: this._tabController,
//                 tabs: <Widget>[
//                   Tab(text: '资讯'),
//                   Tab(text: '技术'),
//                 ],
//               ),
//             ),
//           ),
//         ];
//       },
//       body: TabBarView(
//         controller: this._tabController,
//         children: <Widget>[
//           _buildTabNewsList(_technologyKey, _technologyList),
//         ],
//       ),
//     );
//   }
// }
//
// class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
//   final TabBar child;
//
//   StickyTabBarDelegate({required this.child});
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       color: Theme.of(context).backgroundColor,
//       child: this.child,
//     );
//   }
//
//   @override
//   double get maxExtent => this.child.preferredSize.height;
//
//   @override
//   double get minExtent => this.child.preferredSize.height;
//
//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }
