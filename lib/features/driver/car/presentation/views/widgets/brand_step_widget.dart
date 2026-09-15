import 'package:car_rental/features/driver/car/presentation/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'brand_gridview_widget.dart';

class BrandStepWidget extends StatelessWidget {
  const BrandStepWidget({super.key, required this.carBrand});
  final String carBrand;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(text: 'Car Brand'),
        BrandGridViewWidget(carBrand: carBrand),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
