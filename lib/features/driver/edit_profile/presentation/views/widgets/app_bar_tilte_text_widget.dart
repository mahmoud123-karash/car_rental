import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Edit Profile",
      style: TextStyle(
        color: whiteColor,
        fontSize: 20,
      ),
    );
  }
}
