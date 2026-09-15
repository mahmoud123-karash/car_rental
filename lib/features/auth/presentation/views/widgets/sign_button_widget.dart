import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/auth/presentation/views/register_screen.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class SignButtonWidget extends StatelessWidget {
  const SignButtonWidget({super.key, required this.text, this.onTap});
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap ??
          () {
            if (text == 'Sign up' || text == S.of(context).sign_up) {
              navigateTo(context, const RegisterScreen());
            } else {
              Navigator.pop(context);
            }
          },
      hoverColor: appColor,
      child: Text(
        text,
        style: TextStyles.style15.copyWith(
          color: appColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
