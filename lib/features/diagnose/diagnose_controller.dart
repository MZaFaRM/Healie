import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healie/features/diagnose/diagnose_repository.dart';
import 'package:healie/features/diagnose/models/summary_data.dart';

final reportControllerProvider =
    StateNotifierProvider<ReportController, bool>((ref) {
  return ReportController(ref.read(reportRepositoryProvider));
});

class ReportController extends StateNotifier<bool> {
  ReportController(this._diagnoseRepository) : super(false);

  final ReportRepository _diagnoseRepository;

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
