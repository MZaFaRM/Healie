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

  void addMessage(String userMessage, String assisstantMessage) {
    final data = [
      {
        "role": "user",
        "message": userMessage,
      },
      {
        "role": "assistant",
        "message": assisstantMessage,
      }
    ];
    _history = [..._history, ...data];
    debugPrint("HISTORY: $_history");
  }

  Future<types.Message> sendMessage(String message) async {
    state = true;
    final res = await _chatRepository.sendMessage(message, _history);
    state = false;
    return res.fold((l) {
      debugPrint(l.message);
      throw Failure('${l.message}');
    }, (r) {
      final message = types.TextMessage(
        author: assisstant,
        id: 'id',
        text: r["response"]["openai"]["generated_text"],
      );
      return message;
    });
  }

  Future<types.Message> getDiagnosis() async {
    final res = await _chatRepository.getDiagnosis(_history);
    return res.fold((l) {
      debugPrint(l.message);
      throw Failure('${l.message}');
    }, (r) {
      final message = types.TextMessage(
        author: assisstant,
        id: 'diagnosis',
        text: r["response"]["openai"]["generated_text"],
      );
      return message;
    });
  }
}
