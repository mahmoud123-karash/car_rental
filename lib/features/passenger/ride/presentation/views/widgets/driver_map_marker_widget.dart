import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/shared/assets.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class DriverMapMarkerWidget extends StatelessWidget {
  const DriverMapMarkerWidget(
      {super.key, required this.image, required this.name});
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              child: Image.asset(
                Assets.imagesName,
                color: blackColor,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              name,
              style: TextStyles.style13.copyWith(
                color: appColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            )
          ],
        ),
        CircleAvatar(
          radius: 20,
          backgroundImage: image == ''
              ? const AssetImage(Assets.imagesProfile) as ImageProvider
              : NetworkImage(image),
        ),
      ],
    );
  }
}
