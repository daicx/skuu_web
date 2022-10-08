import 'dart:ui';

import 'package:flutter/material.dart';

class SearchItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SearchItem();
}

class _SearchItem extends State<SearchItem> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQueryData.fromWindow(window).padding.top,
          ),
          child: Container(
            height: 60.0,
            child: new Padding(
                padding: const EdgeInsets.all(6.0),
                child: new Card(
                    child: new Container(
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.greenAccent,
                          alignment: Alignment.center,
                          child: TextField(
                            maxLength: 50,
                            style: TextStyle(fontSize: 20),
                            controller: controller,
                            decoration: new InputDecoration(
//                                    contentPadding: EdgeInsets.only(top: 0.0),
                                hintText: 'Search',
                                border: InputBorder.none),
                            // onChanged: onSearchTextChanged,
                          ),
                        ),
                      ),
                      new IconButton(
                        icon: new Icon(Icons.cancel),
                        color: Colors.grey,
                        iconSize: 18.0,
                        onPressed: () {
                          controller.clear();
                          // onSearchTextChanged('');
                        },
                      ),
                    ],
                  ),
                ))),
          ),
        ),
      ),
    );
  }
}
