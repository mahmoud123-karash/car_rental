import 'package:car_rental/features/onboarding/presentation/views/widgets/buttons_row_widget.dart';
import 'package:car_rental/features/onboarding/presentation/views/widgets/image_onboarding_widget.dart';
import 'package:car_rental/features/onboarding/presentation/views/widgets/text_onboarding_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/title_onboarding_widget.dart';

class OnboradingScreen extends StatelessWidget {
  const OnboradingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageOnboardingWidget(),
            TitleOnboardingWidget(),
            TextOnboardingWidget(),
            Spacer(),
            ButtonRowWidget(),
          ],
        ),
      ),
    );
  }
}
