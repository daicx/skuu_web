import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Text(
                        '用户名',
                        style: TextStyle(color: Colors.white, fontSize: 15.sp),
                      ),
                      Image.asset(
                        'imgs/img_default.png',
                        width: 10.w,
                        height: 20.h,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Text(
                        '关注 ',
                        style: TextStyle(color: Colors.white, fontSize: 10.sp),
                      ),
                      Text(
                        '123',
                        style: TextStyle(color: Colors.white, fontSize: 10.sp),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        '粉丝 ',
                        style: TextStyle(color: Colors.white, fontSize: 10.sp),
                      ),
                      Text(
                        '345',
                        style: TextStyle(color: Colors.white, fontSize: 10.sp),
                      ),
                    ],
                  ),
                ],
              )),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  imgPath + 'care.png',
                  width: 35,
                  height: 35,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('关注'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Routes.router.navigateTo(context, Routes.care);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  imgPath + 'collect.png',
                  width: 35,
                  height: 35,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text('收藏'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Routes.navigateTo(context, Routes.collect);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  imgPath + 'order.png',
                  width: 35,
                  height: 35,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('订单'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  imgPath + 'history.png',
                  width: 35,
                  height: 35,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('浏览历史'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Container(
            height: 1,
            color: Colors.black12,
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  imgPath + 'fuli.png',
                  width: 35,
                  height: 35,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('福利中心'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  imgPath + 'shop.png',
                  width: 35,
                  height: 35,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('店铺'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  imgPath + 'fankui.png',
                  width: 35,
                  height: 35,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('意见反馈'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  imgPath + 'set.png',
                  width: 35,
                  height: 35,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('设置'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  imgPath + 'night.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('夜间模式'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  imgPath + 'version.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('当前版本'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Container(
            height: 1,
            color: Colors.black12,
          ),
          ListTile(
            title: Row(
              children: [
                Image.asset(
                  imgPath + 'exit.png',
                  width: 35,
                  height: 35,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('退出登录'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
