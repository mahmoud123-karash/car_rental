import 'package:car_rental/features/driver/settings/presentation/views/widgets/cacged_network_image_widget.dart';
import 'package:flutter/material.dart';

import 'circle_avatar_image_widget.dart';

class DriverImageWidget extends StatelessWidget {
  const DriverImageWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return image != ''
        ? CachedNetworkImageWidget(
            image: image,
          )
        : const CiecleAvatarimageWidget();
  }
}
