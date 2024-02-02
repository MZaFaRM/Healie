import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scaleup/core/config/theme/current_theme_provider.dart';
import 'package:scaleup/core/constants/ui_constants.dart';
import 'package:scaleup/utils/global_keys.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: kPaddingMd,
      children: [
        ListTile(
          title: const Text("Theme"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => showDialog(
              context: context, builder: (_) => const _ThemeDialog()),
        ),
      ],
    );
  }
}

class _ThemeDialog extends ConsumerWidget {
  const _ThemeDialog({super.key});

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
