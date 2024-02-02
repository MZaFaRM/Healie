import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:replicate/replicate.dart';
import 'package:scaleup/config/env.dart';

final replicateControllerProvider =
    StateNotifierProvider<ReplciateController, bool>((ref) {
  return ReplciateController();
});

class ReplciateController extends StateNotifier<bool> {
  ReplciateController() : super(false);

  Future<Prediction> createPrediction() async {
    state = true;
    try {
      Prediction prediction = await Replicate.instance.predictions.create(
        version: Env.version,
        input: {"prompt": "I am diagnosed with hepatitis B. What should I do?"},
      );
      return prediction;
    } catch (e) {
      debugPrint("EROR: $e");
      rethrow;
    } finally {
      state = false;
    }
  }
}
