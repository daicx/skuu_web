import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../component/myshort_video_item.dart';
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
                  height: getHeight(),
                  child: MyImgItem(
                    id: index,
                  ),
                ),
                borderRadius: BorderRadius.circular(10.0),
              );
            } else {
              return Material(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  height: getHeight()-20.w,
                  child: MyShortVideoItem(),
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
    } else if (len >= 1000 && len < 1450) {
      // } else if (len >= 1000 && len < 1430) {
      return 2;
      // } else if (len >= 1430 && len < 2300) {
    } else if (len >= 1450 && len < 2000) {
      return 3;
    } else {
      return 4;
    }
  }

  double getHeight() {
    if (colCount == 1) {
      return 350.w;
    } else {
      return 170.w;
    }
  }
}
