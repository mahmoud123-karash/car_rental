import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/rating_cubit/rating_cubit.dart';
import 'package:car_rental/generated/l10n.dart';
import 'package:flutter/material.dart';

class SubmitReviewMaterialButtonWidget extends StatelessWidget {
  const SubmitReviewMaterialButtonWidget({super.key, required this.uid});
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: MaterialButton(
        color: appColor,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        onPressed: () {
          double rate = CacheHelper.getData(key: 'rate') ?? 0;
          if (rate == 0) {
            showSnackBar(context, S.of(context).please_rate_trip);
          } else {
            RatingCubit.get(context).updateRating(
              uid: uid,
              rate: rate,
              context: context,
            );
          }
        },
        child: Center(
          child: Text(
            S.of(context).submit_review,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
      ),
    );
  }
}
