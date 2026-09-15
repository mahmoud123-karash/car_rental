import 'package:car_rental/core/utils/text_styles.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class RatingHintTextWidget extends StatelessWidget {
  const RatingHintTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).rating_feedback_hint,
      textAlign: TextAlign.center,
      style: TextStyles.style15.copyWith(
        color: const Color(0xFF8A8A8F),
        fontFamily: 'SF UI Display',
      ),
    );
  }
}
