import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/settings/presentation/views/widgets/loading_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: [
          whiteColor,
          gryColor.withOpacity(0.2),
        ],
      ),
      child: const LoadingBuilderWidget(),
    );
  }
}
