import 'dart:convert';
import 'dart:math';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healie/core/constants/ui_constants.dart';
import 'package:healie/features/chat/chat_controller.dart';
import 'package:healie/features/chat/widgets/chat_bubble.dart';
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

    final textTheme = Theme.of(context).textTheme;

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

    void clearMessages() {
      chatControllerRead.clearHistory();
      setState(() {
        _messages.clear();
        count = 0;
        isDiagnosing = false;
        isDiagnosed = false;
      });
    }

    return Scaffold(
      appBar: ChatAppBar(clearMessages: clearMessages),
      body: Padding(
        padding: kPaddingMd,
        child: Column(
          children: [
            Expanded(
              child: _messages.isEmpty
                  ? Center(
                      child: Text("Healie", style: textTheme.displayLarge),
                    )
                  : ListView.builder(
                      itemCount: _messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final isUser = _messages[index].author.id == user.id;

                        return ChatBubble(
                            isUser: isUser, message: _messages[index]);
                      },
                    ),
            ),
            gapH12,
            if (!isDiagnosing)
              SizedBox(
                height: 50,
                child: TextFormField(
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
              ),
          ],
        ),
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

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({
    super.key,
    required this.clearMessages,
  });

  final VoidCallback clearMessages;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Theme.of(context).colorScheme.background,
              child: const Icon(FluentIcons.leaf_two_24_regular),
            ),
            gapW12,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Healie"),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.green,
                    ),
                    gapW4,
                    Text("Always Active", style: textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: clearMessages,
            icon: const Icon(FluentIcons.delete_24_regular),
          ),
          // PopupMenuButton(
          //   itemBuilder: (BuildContext context) {
          //     return [
          //       PopupMenuItem(
          //         child: ListTile(
          //           title: const Text("Clear messages"),
          //         ),
          //           onTap: clearMessages,
          //       ),
          //     ];
          //   },
          // )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

// For the testing purposes, you should probably use https://pub.dev/packages/uuid.
String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}
