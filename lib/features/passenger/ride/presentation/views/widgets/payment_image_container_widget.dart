import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

class PaymentImageContainerWidget extends StatelessWidget {
  const PaymentImageContainerWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: 50,
        height: 70,
        decoration: ShapeDecoration(
          color: whiteColor,
          shape: const CircleBorder(),
        ),
        child: Image.asset(
          image,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
