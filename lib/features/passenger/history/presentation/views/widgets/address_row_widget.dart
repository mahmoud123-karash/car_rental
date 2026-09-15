import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class AddressRowWidget extends StatelessWidget {
  const AddressRowWidget(
      {super.key, required this.color, required this.address});
  final Color color;
  final String address;

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
          width: 10,
        ),
        Container(
          constraints: BoxConstraints(
            maxWidth: appSize(context).width - 150,
          ),
          child: Text(
            address,
            style: TextStyles.style14.copyWith(color: blackColor),
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
