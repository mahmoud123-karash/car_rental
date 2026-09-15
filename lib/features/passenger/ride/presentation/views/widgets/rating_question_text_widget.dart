import 'package:car_rental/core/utils/text_styles.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class RatingQuestionTextWidget extends StatelessWidget {
  const RatingQuestionTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).how_is_your_trip,
      textAlign: TextAlign.center,
      style: TextStyles.style20Bold.copyWith(
        fontFamily: 'SF UI Display',
      ),
    );
  }
}
