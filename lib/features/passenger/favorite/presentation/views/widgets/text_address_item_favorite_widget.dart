import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class TextAddressItemFavoriteWidget extends StatelessWidget {
  const TextAddressItemFavoriteWidget({
    super.key,
    required this.address,
  });
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: appSize(context).width - 150,
      ),
      child: Text(
        address,
        style: TextStyles.style15.copyWith(color: gryColor),
        maxLines: 1,
      ),
    );
  }
}
