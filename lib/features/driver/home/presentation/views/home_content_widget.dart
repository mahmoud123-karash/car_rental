import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/driver/home/data/models/request_model/request_model.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/message_home_builder_widget.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/request_and_view_button_row_widget.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/requests_list_view_widget.dart';
import 'package:flutter/material.dart';

class HomeContentWidget extends StatelessWidget {
  const HomeContentWidget({super.key, required this.requests});
  final List<RequestModel> requests;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          RequestAndViewButtonRowWidget(requests: requests),
          requests.isEmpty
              ? Padding(
                  padding: EdgeInsets.only(top: appSize(context).height / 4),
                  child: const MessageHomeBuilderWidget(
                    message: 'No Requests Yet',
                  ),
                )
              : RequestListViewWidget(requests: requests, isHome: true),
        ],
      ),
    );
  }
}
