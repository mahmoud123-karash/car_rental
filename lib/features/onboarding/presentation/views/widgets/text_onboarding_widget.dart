import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class TextOnboardingWidget extends StatelessWidget {
  const TextOnboardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).onboarding_description,
      style: TextStyles.style20.copyWith(
        color: gryColor.withOpacity(0.6),
      ),
    );
  }
}
