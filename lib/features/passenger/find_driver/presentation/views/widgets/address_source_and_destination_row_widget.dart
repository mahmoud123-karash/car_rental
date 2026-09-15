import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class AddressSourceAndDestinatiomRowWidget extends StatelessWidget {
  const AddressSourceAndDestinatiomRowWidget(
      {super.key, required this.address, required this.color});
  final String address;
  final Color color;

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
        Container(
          constraints: BoxConstraints(maxWidth: appSize(context).width - 120),
          child: Text(
            address,
            style: TextStyles.style17.copyWith(
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
