import 'package:flutter/material.dart';

import '../../../../../../core/constants/constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: gryColor.withOpacity(0.2),
      ),
    );
  }
}
