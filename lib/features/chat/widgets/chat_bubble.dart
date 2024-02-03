import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:healie/core/constants/ui_constants.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.isUser, required this.message});

  final bool isUser;
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: kPaddingSm,
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: isUser
              ? Theme.of(context).colorScheme.onSurface
              : Theme.of(context).colorScheme.surface,
          borderRadius: kBorderRadiusXl.copyWith(
            topLeft: Radius.circular(isUser ? kBorderRadiusXlVal : 0),
            bottomRight: Radius.circular(isUser ? 0 : kBorderRadiusXlVal),
          ),
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        child: Text(
          message.toJson()['text'].toString(),
          style: TextStyle(
            color: isUser
                ? Theme.of(context).colorScheme.surface
                : Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
