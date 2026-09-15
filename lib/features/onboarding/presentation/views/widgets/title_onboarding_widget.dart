import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class TitleOnboardingWidget extends StatelessWidget {
  const TitleOnboardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'OnTrack',
      style: TextStyles.style20Bold.copyWith(
        color: appColor,
      ),
    );
  }
}
