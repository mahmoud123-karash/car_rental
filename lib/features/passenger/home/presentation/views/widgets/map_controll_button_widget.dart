import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

class MapControllButtonWidget extends StatelessWidget {
  const MapControllButtonWidget({
    super.key,
    required this.onTap,
    required this.icon,
  });
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: appColor,
        ),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon),
      ),
    );
  }
}
