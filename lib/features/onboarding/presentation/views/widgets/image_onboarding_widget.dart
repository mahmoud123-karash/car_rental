import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/shared/assets.dart';
import 'package:flutter/material.dart';

class ImageOnboardingWidget extends StatelessWidget {
  const ImageOnboardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: appSize(context).width - 50,
        child: Image.asset(
          Assets.imagesOffer2,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
