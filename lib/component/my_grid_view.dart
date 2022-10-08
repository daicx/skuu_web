import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

//首页
class MyGridView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyGridView();
  }
}

class _MyGridView extends State<MyGridView> {
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
    return Scaffold(
        backgroundColor: Colors.black12,
        body: MasonryGridView.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            return ElevatedButton(
              child: Text('index'),
              onPressed: () {},
            );
          },
        ));
  }

  int getColCount(double len) {
    if (len < 1000) {
      return 2;
    } else if (len >= 1000 && len < 1500) {
      return 4;
    } else {
      return 6;
    }
  }
}
