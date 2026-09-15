import 'package:car_rental/core/shared/assets.dart';
import 'package:flutter/material.dart';

class LoginImageWidget extends StatelessWidget {
  const LoginImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        height: 250,
        child: Image.asset(
          Assets.imagesLogin,
        ),
      ),
    );
  }
}
