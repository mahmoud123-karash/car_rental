import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../../find_driver/presentation/views/widgets/payment_image_widget.dart';

class RidePaymentItemWidget extends StatelessWidget {
  const RidePaymentItemWidget({
    super.key,
    required this.image,
    required this.isChange,
    required this.text,
  });
  final String image;
  final bool isChange;
  final String text;

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
        child: Column(
          children: [
            PaymentImageWidget(image: image),
            const SizedBox(
              height: 5,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
