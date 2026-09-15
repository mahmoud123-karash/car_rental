import 'package:car_rental/core/shared/assets.dart';
import 'package:flutter/material.dart';

class DriverImageWidget extends StatelessWidget {
  const DriverImageWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundImage: image != ''
          ? NetworkImage(image) as ImageProvider
          : const AssetImage(
              Assets.imagesProfile,
            ),
    );
  }
}
