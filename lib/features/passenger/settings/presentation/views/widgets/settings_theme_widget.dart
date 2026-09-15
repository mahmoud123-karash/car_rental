import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class SettingsThemeWidget extends StatelessWidget {
  const SettingsThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      secondary: const Icon(
        Icons.light_mode_outlined,
      ),
      title: Text(
        S.of(context).theme,
        style: const TextStyle(fontSize: 18),
      ),
      value: false,
      onChanged: (value) {
        showSnackBar(context, S.of(context).soon);
      },
    );
  }
}
