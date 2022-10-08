import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LevelIcon extends StatelessWidget {
  final int lv;

  LevelIcon({this.lv = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(getImg()),
      )),
      child: Text(
        lv.toString(),
        style: TextStyle(fontSize: 5, color: Colors.white),
      ),
    );
  }

  String getImg() {
    if (lv < 4) {
      return 'imgs/level.png';
    } else if (lv >= 4 && lv < 11) {
      return 'imgs/level-1.png';
    } else {
      return 'imgs/level-2.png';
    }
  }
}
