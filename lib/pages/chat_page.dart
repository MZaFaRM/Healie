import 'dart:convert';
import 'dart:math';

import 'package:bard_api/bard_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({
    super.key,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final List<types.Message> _messages = [
    types.TextMessage(
      author: const types.User(id: "bot"),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: "1",
      text: "Hi there, how can I help you?",
    ),
  ];
  final _user = const types.User(id: "user");

  @override
  Widget build(BuildContext context) {
    return Chat(
      messages: _messages,
      onSendPressed: _handleSendPressed,
      user: _user,
      timeFormat: DateFormat('HH:mm'),
    );
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) async {
    // await ref
    //     .read(replicateControllerProvider.notifier)
    //     .createPrediction()
    //     .then(
    //       (value) => debugPrint(
    //         value.toString(),
    //       ),
    //     );

    try {
      debugPrint('statement');
      final input = {
        "prompt": "I am diagnosed with hepatitis B. What should I do?"
      };

      final bard = ChatBot(
          sessionId:
              "g.a000gAghPJ0cxt_H9Sv0ZXTu1gGvy4NzGvc4weHiBF392WoLexPrVSTbZasx2eiJZdkcnTjTKgACgYKAY0SAQASFQHGX2MiHn5BVziRW8LKwcg72mlh-hoVAUF8yKopF8uic8jgf3yPo-oPL1ya0076");
      final result =
          await bard.ask("I am diagnosed with hepatitis B. What should I do?");
      debugPrint("RES: $result");
      // Prediction prediction = await Replicate.instance.predictions.create(
      //   version: Env.version,
      //   input: input,
      // );

      // debugPrint("RES: $prediction");
      // } on ReplicateException catch (e) {
      //   debugPrint("REP ERR: ${e.message}");
    } catch (e, st) {
      debugPrint("ERR: $e, \n================\nSTACKTRACE: $st");
    }

    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }
}

// For the testing purposes, you should probably use https://pub.dev/packages/uuid.
String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}
