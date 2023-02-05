import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import '../component/friend_detail.dart';
import '../component/play_video_page.dart';
import '../component/watch_article.dart';
import '../pages/friends/mychat_view.dart';
import '../pages/index/home.dart';
import '../pages/meleft/mycare_page.dart';
import '../pages/meleft/mycollect_page.dart';
import '../pages/search_page.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return MyHomePage();
});
var chathandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  String title = params['title']!.first;
  return MyChatView(
    title: title,
  );
});
var friendDetailhandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  String title = params['title']!.first;
  return FriendDetail(title: title);
});
var carehandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return MyCarePage();
});
var collecthandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return MyCollectPage();
});
var watchthandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return PlayVideoPage();
});
var whatArticlehandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return WhatArticle();
});
var searchPagehandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return SearchPage();
});
