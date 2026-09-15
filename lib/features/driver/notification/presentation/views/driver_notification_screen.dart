import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'widgets/notification_icon_widget.dart';
import 'widgets/notification_list_view_builder_widget.dart';

class DriverNotificationScreen extends StatelessWidget {
  const DriverNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).notifications),
        actions: const [
          NotificationIconWidget(),
        ],
      ),
      body: const NotificationListViewBuiderWidget(
        models: [],
      ),
    );
  }
}
