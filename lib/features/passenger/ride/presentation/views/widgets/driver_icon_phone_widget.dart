import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/services/services.dart';
import 'package:flutter/material.dart';

class DriverIconPhoneWidget extends StatelessWidget {
  const DriverIconPhoneWidget({super.key, required this.phone});
  final String phone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final Uri phoneLaunchUri = Uri(
          scheme: 'tel',
          path: phone,
        );
        openUri(url: phoneLaunchUri);
      },
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
