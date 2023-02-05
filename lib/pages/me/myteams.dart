import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'myteams_item.dart';

//我的小组
class MyTeams extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyTeams();
  }
}

class _MyTeams extends State<MyTeams> {
  final List<String> _items = [];
  double width = 320.0;

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
                maxCrossAxisExtent: width,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return Material(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  child: MyTeamsItem(),
                ),
              );
            }),
      ),
    );
  }
}
