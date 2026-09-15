import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class PaymentNameAndChangeTestWidget extends StatelessWidget {
  const PaymentNameAndChangeTestWidget(
      {super.key, required this.method, required this.isArrived});
  final String method;
  final bool isArrived;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          method,
          style: TextStyles.style15.copyWith(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          isArrived ? 'Please Finish Payment' : 'Change Payment Method',
          style: TextStyles.style13.copyWith(
            color: isArrived ? Colors.amber : const Color(0xFFC8C7CC),
          ),
        ),
      ],
    );
  }
}
