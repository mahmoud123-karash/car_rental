import 'package:car_rental/features/passenger/home/presentation/views/widgets/buttons_row_view_widget.dart';
import 'package:car_rental/features/passenger/home/presentation/views/widgets/payment_list_view_widget.dart';
import 'package:flutter/material.dart';

import 'payment_method_text_widget.dart';

class PaymentSheetWidget extends StatelessWidget {
  const PaymentSheetWidget({
    super.key,
    required this.latD,
    required this.lngD,
    required this.latS,
    required this.lngS,
  });
  final double latD, lngD, latS, lngS;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PaymentMethodTextWidget(),
          const PaymentListViewWidgt(),
          const SizedBox(
            height: 20,
          ),
          ButtonsRowViewWidget(
            latD: latD,
            lngD: lngD,
            latS: latS,
            lngS: lngS,
          ),
        ],
      ),
    );
  }
}
