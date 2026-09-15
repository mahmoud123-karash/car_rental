import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

class PassengerIconWidget extends StatelessWidget {
  const PassengerIconWidget(
      {super.key, required this.onPressed, required this.icon});
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 36,
        height: 36,
        decoration: ShapeDecoration(
          shape: const CircleBorder(),
          color: appColor,
        ),
        child: Icon(
          icon,
          color: whiteColor,
          size: 20,
        ),
      ),
    );
  }
}
