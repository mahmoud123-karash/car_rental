import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/auth/presentation/views/login_screen.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'onboarding_material_button_widget.dart';

class ButtonRowWidget extends StatelessWidget {
  const ButtonRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        children: [
          OnboardingMaterialButtonWidget(
            text: S.of(context).passenger,
            onTap: () {
              saveUserType('passenger');
              navigateTo(context, const LoginScreen());
            },
          ),
          const Spacer(),
          OnboardingMaterialButtonWidget(
            text: S.of(context).driver,
            onTap: () {
              saveUserType('driver');
              navigateTo(context, const LoginScreen());
            },
          )
        ],
      ),
    );
  }
}
