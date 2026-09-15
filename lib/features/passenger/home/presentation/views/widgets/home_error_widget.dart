// ignore_for_file: file_names

import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import 'material_button_widget.dart';

class HomeErrorWidget extends StatelessWidget {
  const HomeErrorWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyles.style18,
          ),
          const SizedBox(
            height: 50,
          ),
          const MaterialButtonWidget(),
        ],
      ),
    );
  }
}
