import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MykuPage extends StatefulWidget {
  final int userId;

  const MykuPage({super.key, required this.userId});

  @override
  State<StatefulWidget> createState() {
    return _MykuPage();
  }
}

class _MykuPage extends State<MykuPage> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            expandedHeight: 0.3.sh,
            pinned: true,
            actions: [
              Padding(padding: EdgeInsets.only(right: 10)
              ,child:  Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      child: Image.asset('imgs/buy.png'),
                    ),
                    InkWell(
                      onTap: () {},
                      child: AutoSizeText(
                        '充值',
                        style: const TextStyle(fontSize: 20,color: Colors.orange),
                        minFontSize: 10,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              )


            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                '小金库',
                style: TextStyle(color: Colors.orange),
              ),
              background: Container(
                color: Colors.white,
                height: 0.3.sh - 50,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 200,
                        width: 200,
                        child: Image.asset(
                          'imgs/vip.png',
                        ),
                      ),
                      Container(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            '会员等级：99',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 25),
                          ),
                          Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          Text(
                            '认证：地产公司经理',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                            // overflow: TextOverflow.ellipsis,
                            // maxLines: 2,
                          ),
                          Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          const Text(
                            'U币：121个',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          const Text(
                            '累计消费：123个',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ];
      },
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 80,
            color: Colors.primaries[index % Colors.primaries.length],
            alignment: Alignment.center,
            child: Text(
              '$index',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }
}
