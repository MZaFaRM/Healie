import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:healie/core/providers.dart';
import 'package:healie/utils/failure.dart';
import 'package:healie/utils/typedefs.dart';

final chatRepositoryProvider =
    Provider((ref) => ChatRepository(ref.read(dioProvider)));

class ChatRepository {
  ChatRepository(this._dio);

  final Dio _dio;

  FutureEither<Map<String, dynamic>> sendMessage(
    String message,
    List<dynamic> history,
  ) async {
    try {
      final data = {"previous_history": history, "prompt": message};
      final res = await _dio.post('/diagnose/', data: data);
      return right(res.data);
    } on DioException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
