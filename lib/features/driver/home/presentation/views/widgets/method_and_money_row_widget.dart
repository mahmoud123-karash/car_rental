import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class MethodAndMoneyRowWidget extends StatelessWidget {
  const MethodAndMoneyRowWidget(
      {super.key, required this.method, required this.price});
  final String method, price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          method,
          style: TextStyles.style16,
        ),
        const Spacer(),
        Text(
          price,
          style: TextStyles.style12,
        ),
      ],
    );
  }
}
