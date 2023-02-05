import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: TemplatePage(),
    );
  }
}

class TemplatePage extends StatefulWidget {
  const TemplatePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TemplatePage();
  }
}

class _TemplatePage extends State<TemplatePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
