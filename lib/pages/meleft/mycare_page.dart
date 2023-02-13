import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../component/level_icon.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: MyCarePage(),
    );
  }
}

//我的小组
class MyCarePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyCarePage();
  }
}

class _MyCarePage extends State<MyCarePage> {
  final List<String> _items = [];

  @override
  void initState() {
    super.initState();
    _items.addAll([
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '11',
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的关注'),
      ),
      backgroundColor: Colors.black12,
      body: Padding(
        padding: EdgeInsets.all(5),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250.0,
                mainAxisSpacing: 5.0,
//                childAspectRatio: 16/9,
                crossAxisSpacing: 5.0),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return Material(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          hoverColor: Colors.grey,
                          onTap: () {
                            setState(() {
                              _items.removeAt(index);
                            });
                          },
                          child: CircleAvatar(
                            radius: 6,
                            child: Text(
                              'X',
                              style: TextStyle(fontSize: 9),
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('imgs/user_default.png'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '大大大,奥大大奥大大奥迪' + _items[index],
                                style: TextStyle(fontSize: 15),
                                overflow: TextOverflow.visible,
                                maxLines: 3,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: 50,
                              height: 20,
                              child: LevelIcon(
                                lv: 3,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('粉丝 '),
                          Text('1212W'),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '2020-12-12 12:12:12',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
