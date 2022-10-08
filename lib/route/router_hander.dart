import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';
import '../pages/search_page.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return MyHomePage();
});
// var chathandle =
//     Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//   String title = params['title']?.first;
//   return MyChatView(
//     title: title,
//   );
// });
// var friendDetailhandle =
//     Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//   String title = params['title']?.first;
//   return FriendDetail(title: title);
// });
// var carehandle =
//     Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//   return MyCarePage();
// });
// var collecthandle =
// Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//   return MyCollectPage();
// });
// var watchthandle =
//     Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//   return PlayVideoPage();
// });
// var whatArticlehandle =
//     Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//   return WhatArticle();
// });
var searchPagehandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return SearchPage();
});
