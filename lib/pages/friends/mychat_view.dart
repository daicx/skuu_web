import 'dart:async';

import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyChatView(title: '',),
    );
  }
}

class MyChatView extends StatefulWidget {
   String title = '未知';

  @override
  _MyChatView createState() => _MyChatView();

  MyChatView({required this.title});
}

class _MyChatView extends State<MyChatView> {
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();

  final ChatUser user = ChatUser(
    name: "Fayeed",
    uid: "123456789",
    avatar:
        "https://static.veer.com/veer/static/resources/keyword/2020-02-19/533ed30de651499da1c463bca44b6d60.jpg",
  );

  final ChatUser otherUser = ChatUser(
    name: "Mrfatty",
    uid: "25649654",
  );

  List<ChatMessage> messages = <ChatMessage>[];
  var m = <ChatMessage>[];

  var i = 0;
  late Timer a;

  late Timer b;
  late Timer c;

  @override
  void initState() {
    super.initState();
    m.add(ChatMessage(user: otherUser, text: '系统草拟马'));
    m.add(ChatMessage(user: otherUser, text: '系统草拟马'));
    m.add(ChatMessage(user: otherUser, text: '系统草拟马'));
    m.add(ChatMessage(user: otherUser, text: '系统草拟马'));
    messages.add(ChatMessage(user: otherUser, text: '草拟马'));
    messages.add(ChatMessage(user: otherUser, text: '草拟马'));
    messages.add(ChatMessage(user: otherUser, text: '草拟马'));
  }

  void systemMessage() {
    a = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (mounted) {
        if (i < 4) {
          setState(() {
            messages = [...messages, m[i]];
          });
          i++;
        }
      }
    });
    // b = Timer.periodic(Duration(milliseconds: 100), (timer) {
    //   if (mounted) {
    //     _chatViewKey.currentState.scrollController
    //       ??..animateTo(
    //         _chatViewKey.currentState?.scrollController.position.maxScrollExtent,
    //         curve: Curves.easeOut,
    //         duration: const Duration(milliseconds: 100),
    //       );
    //   }
    // });
  }

  void onSend(ChatMessage message) {
    print(message.toJson());
    if (mounted) {
      setState(() {
        messages = [...messages, message];
        print(messages.length);
      });
    }

    if (i == 0) {
      systemMessage();
      c = Timer.periodic(Duration(milliseconds: 300), (timer) {
        if (mounted) {
          systemMessage();
        }
      });
    } else {
      systemMessage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: DashChat(
          key: _chatViewKey,
          inverted: false,
          onSend: onSend,
          sendOnEnter: true,
          textInputAction: TextInputAction.send,
          user: user,
          inputDecoration:
              InputDecoration.collapsed(hintText: "请输入内容"),
          dateFormat: DateFormat('yyyy-MM-dd'),
          timeFormat: DateFormat('HH:mm'),
          messages: messages,
          showUserAvatar: true,
          showAvatarForEveryMessage: true,
          scrollToBottom: true,
          onPressAvatar: (ChatUser user) {
            print("OnPressAvatar: ${user.name}");
          },
          onLongPressAvatar: (ChatUser user) {
            print("OnLongPressAvatar: ${user.name}");
          },
          inputMaxLines: 5,
          messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
          alwaysShowSend: true,
          inputTextStyle: TextStyle(fontSize: 16.0),
          inputContainerStyle: BoxDecoration(
            border: Border.all(width: 0.0),
            color: Colors.white,
          ),
          /* onQuickReply: (Reply reply) {
            setState(() {
              messages.add(ChatMessage(
                  text: reply.value, createdAt: DateTime.now(), user: user));

              messages = [...messages];
            });

            Timer(Duration(milliseconds: 300), () {
              _chatViewKey.currentState.scrollController
                ..animateTo(
                  _chatViewKey
                      .currentState.scrollController.position.maxScrollExtent,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 300),
                );

              if (i == 0) {
                systemMessage();
                Timer(Duration(milliseconds: 600), () {
                  systemMessage();
                });
              } else {
                systemMessage();
              }
            });
          },*/
          onLoadEarlier: () {
            print("loading...");
          },
          shouldShowLoadEarlier: false,
          showTraillingBeforeSend: true,
          trailing: <Widget>[
            IconButton(
              icon: Icon(Icons.photo),
              onPressed: () {
                /*File result = await ImagePicker.pickImage(
                  source: ImageSource.gallery,
                  imageQuality: 80,
                  maxHeight: 400,
                  maxWidth: 400,
                );*/
              },
            )
          ],
        ));
  }

  @override
  void dispose() {
    a.cancel();
    b.cancel();
    c.cancel();
    super.dispose();
  }
}
