import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

class LoadingDrawLineWidget extends StatelessWidget {
  const LoadingDrawLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 100,
      height: 100,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
