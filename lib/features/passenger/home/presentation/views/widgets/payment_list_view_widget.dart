import 'package:car_rental/core/services/lists.dart';
import 'package:car_rental/core/services/services.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/payment_item_widget.dart';
import 'package:flutter/material.dart';

class PaymentListViewWidgt extends StatefulWidget {
  const PaymentListViewWidgt({super.key});

  @override
  State<PaymentListViewWidgt> createState() => _PaymentListViewWidgtState();
}

class _PaymentListViewWidgtState extends State<PaymentListViewWidgt> {
  int cIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              cIndex = index;
              savefPaymentMethod(index);
              setState(() {});
            },
            child: PaymentItemWidget(
              image: paymentImages[index],
              isChange: cIndex == index,
            ),
          ),
          itemCount: 3,
        ),
      ),
    );
  }
}
