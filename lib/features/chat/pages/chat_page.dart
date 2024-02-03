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

  int count = 0;
  bool isDiagnosing = false;
  bool isDiagnosed = false;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final chatControllerRead = ref.read(chatControllerProvider.notifier);
    final user = chatControllerRead.user;
    final isLoading = ref.watch(chatControllerProvider);

    debugPrint("COUNT: $count");

    if (isDiagnosing && !isDiagnosed) {
      final message = types.TextMessage(
        author: chatControllerRead.assisstant,
        id: 'diagnosing',
        text: "Diagnosing...",
      );

      _addMessage(message);

      chatControllerRead.getDiagnosis().then((value) {
        _addMessage(value);
        isDiagnosed = true;
      }).catchError((e) {
        _addMessage(types.TextMessage(
          id: 'error',
          author: chatControllerRead.assisstant,
          text: "An error occurred. Please try again.",
        ));
        isDiagnosed = true;
      });
    }

    void handleSendPressed() async {
      final message = _controller.text.trim();
      if (message.isEmpty) return;

      _controller.clear();

      final textMessage = types.TextMessage(
        author: user,
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
        ref
            .read(chatControllerProvider.notifier)
            .addMessage(message, response.toJson()['text'].toString());
        count++;

        if (count >= 3) setState(() => isDiagnosing = true);
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

                return ChatBubble(isUser: isUser, message: _messages[index]);
              },
            ),
          ),
          gapH12,
          if (!isDiagnosing)
            TextFormField(
              controller: _controller,
              onFieldSubmitted: (_) => handleSendPressed(),
              enabled: !isLoading,
              decoration: kTextFieldDecoratoinDark.copyWith(
                hintText: "Type a message",
                suffix: IconButton(
                  onPressed: handleSendPressed,
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

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.isUser, required this.message});

  final bool isUser;
  final types.Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
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
        child: Text(message.toJson()['text'].toString()),
      ),
    );
  }
}
