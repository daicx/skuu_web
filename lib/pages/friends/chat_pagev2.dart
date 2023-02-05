import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

import '../../demo/chat/chat_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: ChatPageV2(chatId: 12,),
    );
  }
}

class ChatPageV2 extends StatefulWidget {
  int chatId;

  ChatPageV2({this.chatId = 0});

  @override
  _ChatPageV2 createState() => _ChatPageV2();
}

class _ChatPageV2 extends State<ChatPageV2> {
  List<ChatMessage> messages = basicSample;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chatId.toString()),
      ),
      body: DashChat(
        currentUser: user,
        onSend: (ChatMessage m) {
          setState(() {
            messages.insert(0, m);
          });
        },
        messages: messages,
        inputOptions: const InputOptions(
          sendOnEnter: true,
        ),
        messageListOptions: MessageListOptions(
          onLoadEarlier: () async {
            await Future.delayed(const Duration(seconds: 3));
          },
        ),
      ),
    );
  }
}
