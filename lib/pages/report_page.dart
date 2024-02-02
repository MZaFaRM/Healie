import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Card(
          child: ListTile(
            leading: Icon(FluentIcons.document_one_page_24_regular),
            title: Text("Your Documents"),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(FluentIcons.food_24_regular),
            title: const Text("Personalized Diet"),
            trailing: FilledButton(
              onPressed: () {},
              child: const Text('Create'),
            ),
          ),
        ),
        const Card(
            child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Your Health Data Summary",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(height: 4),
              Text("BMI: 24.5\nBlood Pressure: 120/80\nBlood Sugar: 5.5",
                  style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 8),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            ],
          ),
        )),
      ],
    );
  }
}
