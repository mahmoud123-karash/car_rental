import 'package:car_rental/features/driver/notification/data/models/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationDetailsScreen extends StatelessWidget {
  const NotificationDetailsScreen({super.key, required this.model});
  final NotificationModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.type),
      ),
    );
  }
}
