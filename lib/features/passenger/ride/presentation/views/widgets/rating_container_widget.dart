import 'package:car_rental/features/passenger/ride/presentation/views/widgets/rating_trip_details_widget.dart';
import 'package:car_rental/features/passenger/ride/presentation/views/widgets/submit_review_builder_button_widget.dart';
import 'package:car_rental/features/passenger/ride/presentation/views/widgets/trip_details_row_widget.dart';
import 'package:car_rental/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'rating_bar_widget.dart';
import 'rating_hint_text_widget.dart';
import 'rating_question_text_widget.dart';

class RatingContaiberWidget extends StatelessWidget {
  const RatingContaiberWidget({
    super.key,
    required this.name,
    required this.driverUid,
    required this.rideUid,
    required this.date,
    required this.source,
    required this.destination,
    required this.method,
    required this.price,
  });
  final String name,
      driverUid,
      rideUid,
      date,
      source,
      destination,
      method,
      price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 16,
      ),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 10,
              offset: Offset(0, 4),
              spreadRadius: 5,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40 + 13),
          child: Column(
            children: [
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyles.style17,
              ),
              const SizedBox(height: 5),
              TripDetailsRowWidget(
                text: 'Trip Completed',
                value: '${rideUid.substring(25)}###',
              ),
              TripDetailsRowWidget(text: 'Date', value: date),
              const SizedBox(
                height: 20,
              ),
              const RatingQuestionTextWidget(),
              const SizedBox(height: 5),
              const RatingHintTextWidget(),
              const SizedBox(height: 30),
              const RatingBarWidget(),
              const Spacer(),
              RatingTripDetailsWidget(
                source: source,
                destination: destination,
                method: method,
                price: price,
              ),
              const Spacer(),
              SubmitReviewBuilderButtonWIdget(uid: driverUid),
            ],
          ),
        ),
      ),
    );
  }
}
