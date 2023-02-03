import 'package:flutter/material.dart';

typedef OnClick = void Function();

class ItemCountTitle extends StatelessWidget {
  final count;
  final OnClick? onClick;
  final String title;
  final double? fontSize;

  ItemCountTitle(this.title,
      {Key? key, this.onClick, this.count, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(),
      onTap: () {
        onClick!();
      },
    );
  }
}
