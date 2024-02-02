import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:healie/features/chat/pages/chat_page.dart';
import 'package:healie/features/settings/settings_page.dart';
import 'package:healie/pages/report_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: const [
            ChatPage(),
            ReportPage(),
            SettingsPage(),
          ],
        ),
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
          NavigationDestination(
            icon: Icon(FluentIcons.settings_24_regular),
            selectedIcon: Icon(FluentIcons.settings_24_filled),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
