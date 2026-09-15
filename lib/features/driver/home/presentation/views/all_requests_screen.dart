import 'package:car_rental/features/driver/home/data/models/request_model/request_model.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/message_home_builder_widget.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/requests_list_view_widget.dart';
import 'package:flutter/material.dart';

class AllRequestsScreen extends StatelessWidget {
  const AllRequestsScreen(
      {super.key, required this.requests, required this.title});
  final List<RequestModel> requests;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: requests.isEmpty
            ? MessageHomeBuilderWidget(message: 'No $title')
            : RequestListViewWidget(requests: requests, isHome: false),
      ),
    );
  }
}
