import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healie/core/config/theme/current_theme_provider.dart';
import 'package:healie/utils/global_keys.dart';

class ChooseThemeDialog extends ConsumerWidget {
  const ChooseThemeDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final options = [Them];

    return AlertDialog(
      title: const Text("Theme"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: ThemeMode.values
            .map((e) => ListTile(
                  leading: Radio<ThemeMode>(
                    value: e,
                    groupValue: ref.watch(currentThemeProvider),
                    onChanged: (value) {
                      ref.read(currentThemeProvider.notifier).state = value!;
                      navigatorKey.currentState!.pop();
                    },
                  ),
                  title: Text(e.name),
                  onTap: () {
                    ref.read(currentThemeProvider.notifier).state = e;
                    navigatorKey.currentState!.pop();
                  },
                ))
            .toList(),
      ),
    );
  }
}
