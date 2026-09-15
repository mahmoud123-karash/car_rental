import 'package:car_rental/core/shared/assets.dart';
import 'package:flutter/material.dart';

class DriverImageCircleAvatarWidget extends StatelessWidget {
  const DriverImageCircleAvatarWidget({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 35,
      backgroundImage: image == ''
          ? const AssetImage(Assets.imagesCar) as ImageProvider
          : NetworkImage(image),
    );
  }
}
