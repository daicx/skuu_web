import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// 自定义按钮
class ButtonImg extends StatelessWidget {
  final VoidCallback onPress;
  final String img;
  final String text;
  final double textSize;
  final Color color;
  final Color textColor;

  const ButtonImg(
      {Key? key,
      required this.onPress,
      required this.img,
      required this.text,
      this.color = Colors.white,
      required this.textColor,
         this.textSize = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(
            img,
            width: 30,
            height: 30,
          ),
          Text(
            text,
            style: TextStyle(color: textColor,fontSize: textSize),
          ),
        ],
      ),
    );
  }
}
