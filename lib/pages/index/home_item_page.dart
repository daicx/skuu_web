import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'myindex_video_item.dart';
import 'myimg_item.dart';

//首页
class HomeItemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeItemPage();
  }
}

class _HomeItemPage extends State<HomeItemPage> {
  final List<String> _items = [];
  int colCount = 2;

  @override
  void initState() {
    super.initState();
    _items.addAll([
      '1',
      '1',
      '1',
      '1',
      '1',
      '1',
      '1',
      '1',
      '1',
      '1',
    ]);
  }

  @override
  Widget build(BuildContext context) {
//    double width = MediaQuery.of(context).size.width;
//    int count = getColCount(width);
    setState(() {
      colCount = getColCount(MediaQuery.of(context).size.width);
    });
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: EdgeInsets.all(5),
        // ignore: missing_required_param
        child: MasonryGridView.count(
          itemCount: _items.length,
          crossAxisCount: colCount,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          itemBuilder: (BuildContext context, int index) {
            if (index % 2 == 0) {
              return Material(
                child: Container(
                  height: getImgItemHeight(index > 6 ? 6 : index),
                  child: MyImgItem(
                    id: index > 6 ? 6 : index,
                  ),
                ),
                borderRadius: BorderRadius.circular(10.0),
              );
            } else {
              return Material(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  height: getVideoItemHeight(),
                  child: MyIndexVideoItem(),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  int getColCount(double len) {
    // print(len);
    if (len < 1000) {
      return 1;
      // } else if (len >= 1000 && len < 1450) {
      //   // } else if (len >= 1000 && len < 1430) {
      //   return 2;
      //   // } else if (len >= 1430 && len < 2300) {
      // } else if (len >= 1450 && len < 2000) {
      //   return 3;
      // } else {
    } else {
      return 2;
    }
  }

  //动态根据图片个数算item高度
  double getImgItemHeight(int itemCount) {
    //没有图片的时候
    if (itemCount == 0) {
      return 155;
    }
    double widthItem = 1.sw;
    if (colCount > 1) {
      widthItem = 0.5.sw;
    }
    //图片超过3个的时候，高度固定
    if (itemCount > 3) {
      return (2 / 3) * widthItem + 120;
    }
    return widthItem / itemCount + 130;
  }

  double getVideoItemHeight() {
    double widthItem = 1.sw;
    if (colCount > 1) {
      widthItem = 0.5.sw;
    }
    return widthItem / (15/9) + 150;
  }

  int getImgItemCount() {
    return Random().nextInt(3) + 1;
  }
}
