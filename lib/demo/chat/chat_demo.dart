import 'package:flutter/material.dart';
import 'package:skuu_web/demo/chat/quick_replies_sample.dart';
import 'package:skuu_web/demo/chat/send_on_enter.dart';
import 'package:skuu_web/demo/chat/typing_users_sample.dart';

import 'avatar.dart';
import 'basic.dart';
import 'media.dart';
import 'mention.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dash Chat Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dash Chat Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => push(Basic()),
              child: const Text('Basic'),
            ),
            ElevatedButton(
              onPressed: () => push(Media()),
              child: const Text('Chat media'),
            ),
            ElevatedButton(
              onPressed: () => push(AvatarSample()),
              child: const Text('All user possibilities'),
            ),
            ElevatedButton(
              onPressed: () => push(QuickRepliesSample()),
              child: const Text('Quick replies'),
            ),
            ElevatedButton(
              onPressed: () => push(TypingUsersSample()),
              child: const Text('Typing users'),
            ),
            ElevatedButton(
              onPressed: () => push(SendOnEnter()),
              child: const Text('Send on enter'),
            ),
            ElevatedButton(
              onPressed: () => push(MentionSample()),
              child: const Text('Mention'),
            ),
          ],
        ),
      ),
    );
  }

  void push(Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<String>(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
  }
}