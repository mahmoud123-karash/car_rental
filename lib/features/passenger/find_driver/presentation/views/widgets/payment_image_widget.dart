import 'package:flutter/material.dart';

class PaymentImageWidget extends StatelessWidget {
  const PaymentImageWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Center(
        child: SizedBox(
          height: 45,
          child: Image.asset(
            image,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
