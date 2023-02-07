import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'myvideo_video_item.dart';

//视频-短视频页面
class MyVideoShortItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyVideoShortItem();
  }
}

class _MyVideoShortItem extends State<MyVideoShortItem> {
  final List<String> _items = [];
  double maxCross = 1000;

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
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: EdgeInsets.all(5),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: getRatio(),
                maxCrossAxisExtent: maxCross,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return Material(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  child: MyVideoVideoItem(),
                ),
              );
            }),
      ),
    );
  }

  double getRatio() {
    double width = 1.sw;
    if (width > maxCross) {
      width = 0.5.sw;
    }
    return width/(width / (15 / 9) + 150);
  }
}
