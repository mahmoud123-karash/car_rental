import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/driver/history/data/models/history_model.dart';
import 'package:car_rental/features/driver/history/presentation/views/widgets/status_and_follow_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'address_row_widget.dart';
import 'price_and_date_widget.dart';
import 'stepper_source_destination_widget.dart';

class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget({super.key, required this.model});
  final HistoryModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
        color: whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatusAndFollowRowWidget(model: model),
            const SizedBox(
              height: 16,
            ),
            AddressRowWidget(
              address: model.sAddress,
              color: Colors.greenAccent,
            ),
            const StepperSourceDestinationWidget(),
            AddressRowWidget(
              address: model.dAddress,
              color: Colors.red,
            ),
            const SizedBox(
              height: 22,
            ),
            PriceAndDateWidget(
              price: model.price,
              time: DateFormat('yyyy-MM-dd').format(
                model.time.toDate(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
