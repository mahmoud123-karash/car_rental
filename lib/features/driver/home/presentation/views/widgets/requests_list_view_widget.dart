import 'package:car_rental/features/driver/home/data/models/request_model/request_model.dart';
import 'package:car_rental/features/driver/home/presentation/views/widgets/request_item_widget.dart';
import 'package:flutter/material.dart';

import 'history_item_widget.dart';

class RequestListViewWidget extends StatelessWidget {
  const RequestListViewWidget({
    super.key,
    required this.requests,
    required this.isHome,
  });
  final List<RequestModel> requests;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => requests[index].rideStatus == 'new'
            ? RequestItemWidget(request: requests[index])
            : HistoryItemWidget(model: requests[index]),
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemCount: isHome
            ? requests.length > 2
                ? 2
                : requests.length
            : requests.length,
      ),
    );
  }
}
