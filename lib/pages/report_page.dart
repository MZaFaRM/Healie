import 'package:flutter/material.dart';
import 'package:healie/core/constants/ui_constants.dart';
import 'package:healie/features/diagnose/widgets/summary_card.dart';
import 'package:healie/utils/widgets/gaps.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar()),
      body: ListView(
        padding: kPadding3xl,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Your Documents",
                  style: Theme.of(context).textTheme.titleLarge),
              gapW4,
              TextButton(onPressed: () {}, child: const Text("View All")),
            ],
          ),
          gapH20,
          const ListTile(
            leading: Icon(Icons.document_scanner_rounded),
            title: Text("Your Documents"),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          gapH16,
          const ListTile(
            leading: Icon(Icons.document_scanner_rounded),
            title: Text("Your Documents"),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          gapH20,
          const Divider(),
          gapH12,
          // const Card(
          //   child: ListTile(
          //     leading: Icon(FluentIcons.document_one_page_24_regular),
          //     title: Text("Your Documents"),
          //     trailing: Icon(Icons.arrow_forward_ios_rounded),
          //   ),
          // ),
          // gapH8,
          // Card(
          //   child: ListTile(
          //     leading: const Icon(FluentIcons.food_24_regular),
          //     title: const Text("Personalized Diet"),
          //     trailing: FilledButton(
          //       onPressed: () {},
          //       child: const Text('Create'),
          //     ),
          //   ),
          // ),
          // gapH8,
          const SummaryCard(),
        ],
      ),
    );
  }
}
