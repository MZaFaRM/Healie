import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healie/core/constants/ui_constants.dart';
import 'package:healie/features/settings/widgets/choose_theme_dialog.dart';

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
              context: context, builder: (_) => const ChooseThemeDialog()),
        ),
      ],
    );
  }
}
