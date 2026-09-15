import 'package:car_rental/features/driver/history/data/models/history_model.dart';
import 'package:flutter/material.dart';

import 'history_item_widget.dart';

class HistoryListViewWidget extends StatelessWidget {
  const HistoryListViewWidget({super.key, required this.list});
  final List<HistoryModel> list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.separated(
        itemBuilder: (context, index) => HistoryItemWidget(
          model: list[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 15,
        ),
        itemCount: list.length,
      ),
    );
  }
}
