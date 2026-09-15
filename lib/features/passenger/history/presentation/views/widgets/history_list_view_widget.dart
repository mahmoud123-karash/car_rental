import 'package:car_rental/features/passenger/history/data/models/history_model.dart';
import 'package:car_rental/features/passenger/history/presentation/views/widgets/history_item_widget.dart';
import 'package:flutter/material.dart';

class HistoryListViewWidget extends StatelessWidget {
  const HistoryListViewWidget({super.key, required this.models});
  final List<HistoryModel> models;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ListView.separated(
        itemCount: models.length,
        separatorBuilder: (context, index) => const SizedBox(
          height: 15,
        ),
        itemBuilder: (context, index) =>
            HistoryItemWidget(model: models[index]),
      ),
    );
  }
}
