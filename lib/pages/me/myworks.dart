import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mywork_item.dart';
//我的小组
class MyWorks extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyWorks();
  }

}

class _MyWorks extends State<MyWorks>{

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
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: EdgeInsets.all(5),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 320.0,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return Material(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
//                    color: Colors.green,
                  child: MyWorkItem(),
                ),
              );
            }),
      ),
    );
  }
}