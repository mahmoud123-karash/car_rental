import 'package:car_rental/features/driver/notification/data/models/notification_model.dart';
import 'package:car_rental/features/driver/notification/presentation/views/widgets/notification_list_view_widget.dart';
import 'package:flutter/material.dart';

class NotificationListViewBuiderWidget extends StatelessWidget {
  const NotificationListViewBuiderWidget({super.key, required this.models});
  final List<NotificationModel> models;

  @override
  Widget build(BuildContext context) {
    return const NotificationListViewWidget();
  }
}
