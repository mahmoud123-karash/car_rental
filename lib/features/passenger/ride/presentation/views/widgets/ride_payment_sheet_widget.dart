import 'package:flutter/material.dart';
import 'payment_list_view_widget.dart';

class RidePaymentSheetWidget extends StatelessWidget {
  const RidePaymentSheetWidget(
      {super.key, required this.uid, required this.method});
  final String uid, method;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: PaymentListViewWidgt(uid: uid, method: method),
    );
  }
}
