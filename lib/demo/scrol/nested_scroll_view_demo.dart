import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: NestedScrollViewDemo(),
    );
  }
}

class NestedScrollViewDemo extends StatefulWidget {
  const NestedScrollViewDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NestedScrollViewDemo();
  }
}

class _NestedScrollViewDemo extends State<NestedScrollViewDemo> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[SliverAppBar(
          expandedHeight: 230.0,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('复仇者联盟'),
            background: Image.network(
              'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
        )];
      },
      body: ListView.builder(itemBuilder: (BuildContext context,int index){
        return Container(
          height: 80,
          color: Colors.primaries[index % Colors.primaries.length],
          alignment: Alignment.center,
          child: Text(
            '$index',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        );
      },itemCount: 20,),
    );
  }
}
