import 'package:car_rental/core/services/services.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/views/widgets/driver_rating_row_widget.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class DriverNameAndRatingColumWidget extends StatelessWidget {
  const DriverNameAndRatingColumWidget(
      {super.key, required this.rating, required this.name});
  final List<num> rating;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: const BoxConstraints(
            maxWidth: 140,
          ),
          child: Text(
            name,
            style: TextStyles.style17,
            maxLines: 1,
          ),
        ),
        DriverRatingRowWidget(
          rating: getDriverRating(rating),
        )
      ],
    );
  }
}
