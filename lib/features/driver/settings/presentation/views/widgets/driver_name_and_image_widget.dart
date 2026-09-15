import 'package:flutter/material.dart';

import 'driver_image_widget.dart';
import 'driver_name_colum_widget.dart';

class DriverNameAndImageWidget extends StatelessWidget {
  const DriverNameAndImageWidget({
    super.key,
    required this.name,
    required this.image,
  });
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 25,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DriverImageWidget(image: image),
          const SizedBox(
            width: 15,
          ),
          DriverNameColumWidget(name: name),
        ],
      ),
    );
  }
}
