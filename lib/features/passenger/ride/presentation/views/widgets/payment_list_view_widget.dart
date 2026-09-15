import 'package:car_rental/core/services/lists.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/payment_cubit/payment_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ride_payment_item_widget.dart';

class PaymentListViewWidgt extends StatefulWidget {
  const PaymentListViewWidgt(
      {super.key, required this.uid, required this.method});
  final String uid;
  final String method;

  @override
  State<PaymentListViewWidgt> createState() => _PaymentListViewWidgtState();
}

class _PaymentListViewWidgtState extends State<PaymentListViewWidgt> {
  String method = '';
  @override
  void initState() {
    method = widget.method;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentStates>(
      builder: (context, state) => SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              method = paymentTexts[index];
              Navigator.pop(context);
              PaymentCubit.get(context).saveMethod(
                method: method,
                uid: widget.uid,
              );
            },
            child: RidePaymentItemWidget(
              image: paymentImages[index],
              text: paymentTexts[index],
              isChange: method == paymentTexts[index],
            ),
          ),
          itemCount: 3,
        ),
      ),
    );
  }
}
