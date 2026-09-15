import 'package:car_rental/features/passenger/ride/presentation/views/widgets/trip_details_row_widget.dart';
import 'package:car_rental/features/passenger/ride/presentation/views/widgets/trip_details_text_widget.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class RatingTripDetailsWidget extends StatelessWidget {
  const RatingTripDetailsWidget(
      {super.key,
      required this.source,
      required this.destination,
      required this.method,
      required this.price});
  final String source, destination, method, price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: ShapeDecoration(
          color: const Color(0x7FEFEFF4),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFEEEEF1)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: Column(
            children: [
              const TripDetailsTextWidget(),
              TripDetailsRowWidget(text: S.of(context).pick_up_location, value: source),
              TripDetailsRowWidget(text: S.of(context).destination, value: destination),
              TripDetailsRowWidget(text: S.of(context).payment_method, value: method),
              TripDetailsRowWidget(text: S.of(context).price, value: price),
            ],
          ),
        ),
      ),
    );
  }
}
