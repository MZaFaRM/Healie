import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healie/features/diagnose/diagnose_repository.dart';
import 'package:healie/features/diagnose/models/summary_data.dart';

final diagnoseControllerProvider =
    StateNotifierProvider<DiagnoseController, bool>((ref) {
  return DiagnoseController(ref.read(diagnoseRepositoryProvider));
});

class DiagnoseController extends StateNotifier<bool> {
  DiagnoseController(this._diagnoseRepository) : super(false);

  final DiagnoseRepository _diagnoseRepository;

  Future<String> getSummary(SummaryData data) async {
    state = true;
    final result = await _diagnoseRepository.getSummary(data);
    state = false;
    return result.fold((l) {
      debugPrint('Error: ${l.message}');
      return 'Something weng wrong!';
    }, (r) => r);
  }
}
