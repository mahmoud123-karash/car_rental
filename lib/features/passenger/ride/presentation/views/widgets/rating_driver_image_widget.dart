import 'package:car_rental/core/shared/assets.dart';
import 'package:flutter/material.dart';

class RatingDriverImageWidget extends StatelessWidget {
  const RatingDriverImageWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundImage: image == ''
          ? const AssetImage(Assets.imagesProfile) as ImageProvider
          : NetworkImage(image),
    );
  }
}
