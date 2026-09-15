import 'package:flutter/material.dart';

import 'driver_name_widget.dart';
import 'driver_rating_widget.dart';

class DriverNameAndRatingWidget extends StatelessWidget {
  const DriverNameAndRatingWidget(
      {super.key, required this.name, required this.rating});
  final String name;
  final List<num> rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DriverNameWidget(name: name),
        DriverRatingWidget(rating: rating),
      ],
    );
  }
}
