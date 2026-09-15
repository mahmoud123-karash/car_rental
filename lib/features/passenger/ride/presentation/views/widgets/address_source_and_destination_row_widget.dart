import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/ride/presentation/views/widgets/hint_address_widget.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class AddressSourceAndDestinatiomRowWidget extends StatelessWidget {
  const AddressSourceAndDestinatiomRowWidget(
      {super.key,
      required this.address,
      required this.color,
      required this.text});
  final String address;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on_rounded,
          color: color,
          size: 30,
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HintAddessWidget(text: text),
            Container(
              constraints:
                  BoxConstraints(maxWidth: appSize(context).width - 120),
              child: Text(
                address,
                style: TextStyles.style17.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
