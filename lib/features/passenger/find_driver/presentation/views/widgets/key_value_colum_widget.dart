import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class KeyValueColumWidget extends StatelessWidget {
  const KeyValueColumWidget({
    super.key,
    required this.dKey,
    required this.value,
  });
  final String dKey, value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          dKey,
          textAlign: TextAlign.center,
          style: TextStyles.style13,
        ),
        const SizedBox(
          height: 9,
        ),
        Container(
          constraints: const BoxConstraints(
            maxWidth: 50,
          ),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyles.style15.copyWith(
              fontFamily: 'SF UI Display',
              fontWeight: FontWeight.w700,
            ),
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
