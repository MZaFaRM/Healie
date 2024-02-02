import 'package:flutter/foundation.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healie/features/chat/chat_repository.dart';
import 'package:healie/utils/failure.dart';

final chatControllerProvider = StateNotifierProvider<ChatController, bool>(
  (ref) => ChatController(ref.read(chatRepositoryProvider)),
);

final allMessagesProvider = StateProvider<List<types.Message>>((ref) => []);

class ChatController extends StateNotifier<bool> {
  ChatController(this._chatRepository) : super(false);

  final ChatRepository _chatRepository;

  final user = const types.User(id: "user");
  final assisstant = const types.User(id: "bot");

  List<dynamic> _history = [];

  Future<types.Message> sendMessage(String message) async {
    state = true;
    final res = await _chatRepository.sendMessage(message, _history);
    state = false;
    return res.fold((l) {
      debugPrint(l.message);
      throw Failure('${l.message}');
    }, (r) {
      _history = r["response"]["openai"]["message"];

      // List<types.Message> finalMessages = [];
      // for (var i = 0; i < messages.length; i++) {
      //   final message = messages[i];
      //   finalMessages.add(types.TextMessage(
      //     id: '$i',
      //     author: message["role"] == "user" ? user : assisstant,
      //     text: message["message"],
      //   ));
      // }
      // _allMessages = finalMessages;
      final message = types.TextMessage(
        author: assisstant,
        id: 'id',
        text: _history.last["message"],
      );
      return message;
    });
  }
}
