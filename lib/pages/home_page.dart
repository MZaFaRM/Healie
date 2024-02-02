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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.chat_24_regular),
            activeIcon: Icon(FluentIcons.chat_24_filled),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.document_text_24_regular),
            activeIcon: Icon(FluentIcons.document_text_24_filled),
            label: "Report",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.settings_24_regular),
            activeIcon: Icon(FluentIcons.settings_24_filled),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
