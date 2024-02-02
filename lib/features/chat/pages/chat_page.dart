import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healie/core/constants/ui_constants.dart';
import 'package:healie/features/chat/chat_controller.dart';
import 'package:healie/utils/widgets/gaps.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final List<types.Message> _messages = [];

  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    final chatControllerRead = ref.read(chatControllerProvider.notifier);
    final user = chatControllerRead.user;

    void handleSendPressed(String message) async {
      final textMessage = types.TextMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: randomString(),
        text: message,
      );

      _addMessage(textMessage);

      final pleaseWaitMsg = types.TextMessage(
        id: 'please-wait',
        author: chatControllerRead.assisstant,
        text: "Please wait...",
      );

      await Future.delayed(const Duration(microseconds: 300), () {
        _addMessage(pleaseWaitMsg);
      });

      try {
        final response = await chatControllerRead.sendMessage(message);
        _messages.removeWhere((element) => element.id == 'please-wait');
        _addMessage(response);
      } catch (e) {
        _messages.removeWhere((element) => element.id == 'please-wait');
        _addMessage(types.TextMessage(
          id: 'error',
          author: chatControllerRead.assisstant,
          text: "An error occurred. Please try again.",
        ));
      }
    }

    // return Chat(
    //   messages: _messages,
    //   onSendPressed: handleSendPressed,
    //   user: user,
    //   theme: isDark ? const DarkChatTheme() : const DefaultChatTheme(),
    // );

    return Padding(
      padding: kPaddingMd,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                final isUser = _messages[index].author.id == user.id;

                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: kPaddingSm,
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: isUser
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context).colorScheme.onSecondary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8,
                    ),
                    child: Text(_messages[index].toJson()['text'].toString()),
                  ),
                );
              },
            ),
          ),
          gapH12,
          TextFormField(
            controller: _controller,
            decoration: kTextFieldDecoratoinDark.copyWith(
              hintText: "Type a message",
              suffix: IconButton(
                onPressed: () {
                  handleSendPressed(_controller.text);
                  _controller.clear();
                },
                icon: const Icon(Icons.send),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.add(message);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// For the testing purposes, you should probably use https://pub.dev/packages/uuid.
String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}
