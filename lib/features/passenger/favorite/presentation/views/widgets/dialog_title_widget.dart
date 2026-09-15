import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class DialogTextWidget extends StatelessWidget {
  const DialogTextWidget({super.key, required this.address});
  final String address;

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).add_place_name(address),
      style: TextStyles.style15.copyWith(
        fontWeight: FontWeight.w600,
        color: appColor,
      ),
    );
  }
}
