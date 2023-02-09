import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

import '../../../demo/chat/chat_data.dart';

class ComponentItem extends StatefulWidget {
  int chatId;

  ComponentItem({this.chatId = 0});

  @override
  _ComponentItem createState() => _ComponentItem();
}

class _ComponentItem extends State<ComponentItem> {
  List<ChatMessage> messages = basicSample;

  @override
  Widget build(BuildContext context) {
    return DashChat(
      currentUser: user,
      onSend: (ChatMessage m) {
        setState(() {
          messages.insert(0, m);
        });
      },
      messages: messages,
      messageOptions: MessageOptions(maxWidth: 300),
      inputOptions: const InputOptions(
        sendOnEnter: true,
      ),
      messageListOptions: MessageListOptions(
        onLoadEarlier: () async {
          await Future.delayed(const Duration(seconds: 3));
        },
      ),
    );
  }
}
