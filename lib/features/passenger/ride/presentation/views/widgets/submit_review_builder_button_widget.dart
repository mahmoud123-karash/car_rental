import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/passenger/navbar/presentation/views/navbar_screen.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/rating_cubit/rating_cubit.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/rating_cubit/rating_states.dart';
import 'package:car_rental/features/passenger/ride/presentation/views/widgets/submit_review_material_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitReviewBuilderButtonWIdget extends StatefulWidget {
  const SubmitReviewBuilderButtonWIdget({super.key, required this.uid});
  final String uid;

  @override
  State<SubmitReviewBuilderButtonWIdget> createState() =>
      _SubmitReviewBuilderButtonWIdgetState();
}

class _SubmitReviewBuilderButtonWIdgetState
    extends State<SubmitReviewBuilderButtonWIdget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RatingCubit, RatingStates>(
      listener: (context, state) {
        if (state is ErrorUpdateRatingState) {
          showSnackBar(context, state.message);
        }
        if (state is SuceesUpdateRatingState) {
          CacheHelper.removeData(key: 'status');
          if (mounted) {
            navigateToAndFinish(context, const NavBarScreen());
          }
        }
      },
      builder: (context, state) {
        if (state is LoadingUpdateRatingState) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          return SubmitReviewMaterialButtonWidget(
            uid: widget.uid,
          );
        }
      },
    );
  }
}
