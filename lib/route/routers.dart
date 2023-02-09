import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:skuu_web/route/router_hander.dart';

class Routes {
  static late FluroRouter router;

//路由管理
  static String root = "/";
  static String chat = "/chat";
  static String friendDetail = "/friend_detail";
  static String userDetail = "/user_detail";
  static String care = "/cares";
  static String collect = "/collects";
  static String watch = "/watchs";
  static String whatArticle = "/look_article";
  static String searchPage = "/search_page";

  static void configureRoutes(FluroRouter fluroRouter) {
    router = fluroRouter;
    // 未发现对应route
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("route was not found !!!");
      return;
    });
    router.define(root, handler: rootHandler);
    router.define(chat, handler: chathandle);
    router.define(friendDetail, handler: friendDetailhandle);
    router.define(care, handler: carehandle);
    router.define(collect, handler: collecthandle);
    router.define(watch, handler: watchthandle);
    router.define(whatArticle, handler: whatArticlehandle);
    router.define(searchPage, handler: searchPagehandle);
    router.define(userDetail, handler: userDetailPage);
  }

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future navigateTo(BuildContext context, String path,
      {Map<String, List<dynamic>>? params,
      TransitionType transition = TransitionType.native}) {
    String query = "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]!.first);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    print('path:$path,params:$query');
    path = path + query;
    return router.navigateTo(context, path, transition: transition);
  }
}
