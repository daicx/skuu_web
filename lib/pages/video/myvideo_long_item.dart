import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'myvideo_img_item.dart';

//视频-长视频页面
class MyVideoLongItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyVideoLongItem();
  }
}

class _MyVideoLongItem extends State<MyVideoLongItem> {
  final List<String> _items = [];

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
    return Padding(
      padding: EdgeInsets.all(0),
      child: GridView.builder(
          // controller: ScrollController(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500.0,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 3 / 2),
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return Material(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                child: MyVideoImgItem(
                  id: index,
                ),
              ),
            );
          }),
    );
  }
}
