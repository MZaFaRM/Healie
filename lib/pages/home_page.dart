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
          Center(
            child: Text("Report"),
          ),
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
