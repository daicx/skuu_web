import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 自定义按钮
class MyFlatButton extends StatelessWidget {
  final VoidCallback onPress;
  final String img;
  final String text;
  final Color color;
  final Color textColor;

  const MyFlatButton(
      {Key? key,
      required this.onPress,
      required this.img,
      required this.text,
      this.color = Colors.white,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            img,
            width: 30,
            height: 30,
          ),
          Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ],
      ),
    );
  }
}
