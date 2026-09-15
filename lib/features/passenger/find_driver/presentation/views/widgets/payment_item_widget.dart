import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

import 'payment_image_widget.dart';

class PaymentItemWidget extends StatelessWidget {
  const PaymentItemWidget({
    super.key,
    required this.image,
    required this.isChange,
  });
  final String image;
  final bool isChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isChange ? appColor : gryColor,
            width: isChange ? 3 : 1,
          ),
        ),
        child: PaymentImageWidget(image: image),
      ),
    );
  }
}
