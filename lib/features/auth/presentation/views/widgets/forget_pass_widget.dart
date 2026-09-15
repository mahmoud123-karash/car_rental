import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/auth/presentation/views/forget_pass_screen.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class ForgetPassWidget extends StatelessWidget {
  const ForgetPassWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        navigateTo(context, const ForgetPassScreen());
      },
      child: Text(S.of(context).forgot_password_q),
    );
  }
}
