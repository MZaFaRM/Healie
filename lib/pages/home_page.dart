import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:scaleup/pages/chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SCALE UP"),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          ChatPage(),
          ReportPage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int i) => setState(() => _currentIndex = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(FluentIcons.chat_24_regular),
            selectedIcon: Icon(FluentIcons.chat_24_filled),
            label: "Chat",
          ),
          NavigationDestination(
            icon: Icon(FluentIcons.document_text_24_regular),
            selectedIcon: Icon(FluentIcons.document_text_24_filled),
            label: "Report",
          ),
        ],
      ),
    );
  }
}

class ReportPage extends StatelessWidget {
  const ReportPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Card(
          child: ListTile(
            leading: Icon(FluentIcons.document_one_page_24_regular),
            title: Text("Your Documents"),
            trailing: Icon(FluentIcons.chevron_right_24_regular),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(FluentIcons.food_24_regular),
            title: Text("Personalized Diet"),
            trailing: Icon(FluentIcons.chevron_right_24_regular),
          ),
        ),
        Card(
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
