import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';

// 模板,方便快速创建一个StatefulWidget
class WaitPlayVideoList extends StatefulWidget {
  final String title;

  WaitPlayVideoList({required this.title});

  @override
  State<StatefulWidget> createState() {
    return _WaitPlayVideoList();
  }
}

class _WaitPlayVideoList extends State<WaitPlayVideoList> {
  ScrollController _controller = ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮
  final String useDefault = 'imgs/user_default.png';


  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
          controller: _controller,
          child: ListView.builder(
              itemCount: 20,
              itemExtent: 140,
              controller: _controller,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Container(
                    padding: EdgeInsets.only(top: 10),
                    decoration: UnderlineTabIndicator(
                        borderSide: BorderSide(color: Colors.black12)),
                    child: Row(
                      children: [
                        Image.asset(
                          useDefault,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                        Container(
                          width: 10,
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '女教官不甘心输给男新兵，非要比一场，让全场特种兵直呼精彩!',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '爱看电影',
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '19万次播放',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                    });
                  },
                );
                // return InkWell(
                //   onTap: () {},
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Image.asset(
                //         'imgs/user_default.png',
                //         fit: BoxFit.fill,
                //         width: 150,
                //       ),
                //       Container(
                //         color: Colors.white,
                //         width: 5,
                //       ),
                //       Expanded(
                //         child: Padding(
                //           padding: EdgeInsets.only(top: 10),
                //           child: Column(
                //             children: [
                //               Text(
                //                 '女教官不甘心输给男新兵，非要比一场，让全场特种兵直呼精彩!',
                //                 maxLines: 2,
                //                 overflow: TextOverflow.ellipsis,
                //               ),
                //               SizedBox(
                //                 width: 5,
                //               ),
                //               Container(
                //                 alignment: Alignment.centerLeft,
                //                 child: Text(
                //                   '爱看电影',
                //                   style: TextStyle(color: Colors.black54),
                //                 ),
                //               ),
                //               Container(
                //                 alignment: Alignment.centerLeft,
                //                 child: Text(
                //                   '19万次播放',
                //                   style: TextStyle(color: Colors.grey),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // );
              })),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(.0,
                    duration: Duration(microseconds: 500), curve: Curves.ease);
              },
            ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
