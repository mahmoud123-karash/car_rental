import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/services/services.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class DialogLogoutWidget extends StatelessWidget {
  const DialogLogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        S.of(context).logout,
        style: TextStyles.style20.copyWith(
          color: appColor,
        ),
      ),
      content: Text(
        S.of(context).are_you_sure,
        style: TextStyles.style20,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(S.of(context).no),
        ),
        TextButton(
          onPressed: () {
            logout();
            navigateToAndFinish(
              context,
              const OnboradingScreen(),
            );
          },
          child: Text(S.of(context).yes),
        ),
      ],
    );
  }
}
