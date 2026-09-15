import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class TextItemFavoriteWidget extends StatelessWidget {
  const TextItemFavoriteWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyles.style20.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
