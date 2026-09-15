import 'package:car_rental/core/shared/components.dart';
import 'package:flutter/material.dart';

class SettingsThemeWidget extends StatelessWidget {
  const SettingsThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      secondary: const Icon(
        Icons.light_mode_outlined,
      ),
      title: const Text(
        'Theme',
        style: TextStyle(fontSize: 18),
      ),
      value: false,
      onChanged: (value) {
        showSnackBar(context, 'Soon');
      },
    );
  }
}
