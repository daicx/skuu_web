import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../route/routers.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DrawerPage();
  }
}

class _DrawerPage extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return myDrawer();
  }

  Drawer myDrawer() {
    String imgPath = 'imgs/';
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('imgs/user_default.png'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '新飞飞',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    '关注 122  粉丝 999',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  )
                ],
              )),
          ListTile(
            leading: SvgPicture.asset(
              imgPath + 'care.svg',
              width: 35,
              height: 35,
              fit: BoxFit.fill,
            ),
            title: Text('关注'),
            onTap: () {
              Navigator.pop(context);
              Routes.router.navigateTo(context, Routes.care);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              imgPath + 'collect.svg',
              width: 35,
              height: 35,
              fit: BoxFit.fill,
            ),
            title: Text('收藏'),
            onTap: () {
              Navigator.pop(context);
              Routes.navigateTo(context, Routes.collect);
            },
          ),

          ListTile(
            leading: SvgPicture.asset(
              imgPath + 'zuji.svg',
              width: 35,
              height: 35,
              fit: BoxFit.fill,
            ),
            title: Text('足迹'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              imgPath + 'caogao.svg',
              width: 35,
              height: 35,
              fit: BoxFit.fill,
            ),
            title: Text('草稿箱'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              imgPath + 'creator.svg',
              width: 35,
              height: 35,
              fit: BoxFit.fill,
            ),
            title: Text('创作中心'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Container(
            height: 1,
            color: Colors.black12,
          ),
          ListTile(
            leading: SvgPicture.asset(
              imgPath + 'fuli.svg',
              width: 35,
              height: 35,
              fit: BoxFit.fill,
            ),
            title: Text('福利中心'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              imgPath + 'order.svg',
              width: 35,
              height: 35,
              fit: BoxFit.fill,
            ),
            title: Text('订单'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              imgPath + 'gouwuche.svg',
              width: 35,
              height: 35,
              fit: BoxFit.fill,
            ),
            title: Text('购物车'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Container(
            height: 1,
            color: Colors.black12,
          ),
          ListTile(
            leading: SvgPicture.asset(
              imgPath + 'fankui.svg',
              width: 35,
              height: 35,
              fit: BoxFit.fill,
            ),
            title: Text('意见反馈'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              imgPath + 'set.svg',
              width: 35,
              height: 35,
              fit: BoxFit.fill,
            ),
            title: Text('设置'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              imgPath + 'night.svg',
              width: 35,
              height: 35,
              fit: BoxFit.fill,
            ),
            title: Text('夜间模式'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              imgPath + 'version.svg',
              width: 35,
              height: 35,
              fit: BoxFit.fill,
            ),
            title: Text('版本'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              imgPath + 'exist.svg',
              width: 35,
              height: 35,
              fit: BoxFit.fill,
            ),
            title: Text('退出登陆'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
