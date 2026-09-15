import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/history/data/models/history_model.dart';
import 'package:car_rental/features/passenger/history/presentation/views/widgets/line_spacer_widget.dart';
import 'package:car_rental/features/passenger/history/presentation/views/widgets/row_status_and_follow_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'address_row_widget.dart';
import 'price_and_date_widget.dart';

class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget({super.key, required this.model});
  final HistoryModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
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
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowStatusAndFollowWidget(model: model),
              const SizedBox(
                height: 16,
              ),
              AddressRowWidget(
                address: model.sAddress,
                color: Colors.greenAccent,
              ),
              const LineSpacerWidget(),
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
      ),
    );
  }
}
