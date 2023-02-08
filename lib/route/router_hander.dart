import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:skuu_web/pages/friends/chat_pagev2.dart'
    deferred as chat_pagev2;

import '../cache/deferred_widget.dart';
import '../pages/friends/friend_detail.dart' deferred as friend_detail;
import '../component/play_video_page.dart' deferred as play_video_page;
import '../component/watch_article.dart' deferred as watch_article;
import '../pages/index/home.dart';
import '../pages/meleft/mycare_page.dart' deferred as mycare_page;
import '../pages/meleft/mycollect_page.dart' deferred as mycollect_page;
import '../pages/search/search_page.dart' deferred as search_page;

var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return MyHomePage();
});
var chathandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<dynamic>> params) {
  var title = params['chatId']!.first;
  return AppDeferredWidget(
    libraryLoader: chat_pagev2.loadLibrary,
    builder: () => chat_pagev2.ChatPageV2(
      chatId: int.parse(title),
    ),
  );
});
var friendDetailhandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  String title = params['title']!.first;
  // return FriendDetail(title: title);
  return AppDeferredWidget(
    libraryLoader: friend_detail.loadLibrary,
    builder: () => friend_detail.FriendDetail(title: title),
  );
});
var carehandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  // return MyCarePage();
  return AppDeferredWidget(
    libraryLoader: mycare_page.loadLibrary,
    builder: () => mycare_page.MyCarePage(),
  );
});
var collecthandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  // return MyCollectPage();
  return AppDeferredWidget(
    libraryLoader: mycollect_page.loadLibrary,
    builder: () => mycollect_page.MyCollectPage(),
  );
});
var watchthandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  // return PlayVideoPage();
  return AppDeferredWidget(
    libraryLoader: play_video_page.loadLibrary,
    builder: () => play_video_page.PlayVideoPage(),
  );
});
var whatArticlehandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  // return WhatArticle();
  return AppDeferredWidget(
    libraryLoader: watch_article.loadLibrary,
    builder: () => watch_article.WhatArticle(),
  );
});
var searchPagehandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  // return SearchPage();
  return AppDeferredWidget(
    libraryLoader: search_page.loadLibrary,
    builder: () => search_page.SearchPage(),
  );
});
