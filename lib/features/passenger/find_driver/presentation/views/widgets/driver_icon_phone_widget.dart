import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

class DriverIconPhoneWidget extends StatelessWidget {
  const DriverIconPhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        radius: 22,
        backgroundColor: const Color(0xff4252FF),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(
            Icons.phone,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
