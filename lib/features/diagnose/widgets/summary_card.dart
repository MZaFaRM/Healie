import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healie/core/constants/ui_constants.dart';
import 'package:healie/features/diagnose/diagnose_controller.dart';
import 'package:healie/features/diagnose/models/summary_data.dart';
import 'package:healie/utils/widgets/gaps.dart';

class SummaryCard extends ConsumerStatefulWidget {
  const SummaryCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SummaryCardState();
}

class _SummaryCardState extends ConsumerState<SummaryCard> {
  String summary = '';
  bool isLoading = false;

  void submit() {
    setState(() {
      isLoading = true;
    });
    const data = SummaryData(
      bloodPressure: '120/80',
      totalCholesterol: 5,
      bloodSugar: 5,
      bmi: 18,
      restingHeartRate: 70,
      oxygenSaturation: 98,
      waistCircumference: 30,
      bodyFatPercentage: 20,
      muscleMass: 50,
      boneDensity: 2.5,
    );
    ref.read(reportControllerProvider.notifier).getSummary(data).then((value) {
      setState(() {
        summary = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("Your Health Data Summary",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            )),
        gapH12,
        summary.isNotEmpty
            ? Text(summary)
            : GestureDetector(
                onTap: isLoading ? null : submit,
                child: Container(
                  padding: kPaddingLg,
                  margin: const EdgeInsets.only(top: kSpacingMd),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                  child: Center(
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                            "Generate Summary",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ),
              ),
      ],
    );
  }
}
