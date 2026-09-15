import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/driver/settings/presentation/views/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SettingsLoadingBuilderWidget extends StatelessWidget {
  const SettingsLoadingBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: [
          gryColor.withOpacity(0.3),
          whiteColor,
        ],
      ),
      child: const LoadingWidget(),
    );
  }
}
