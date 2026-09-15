import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:flutter/material.dart';

import '../settings_page.dart';

class NotificationIconWidget extends StatelessWidget {
  const NotificationIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        navigateTo(context, const SettingsPage());
      },
      icon: Icon(
        Icons.notifications_none_rounded,
        color: appColor,
      ),
    );
  }
}
