import 'package:car_rental/features/passenger/ride/domain/use_cases/rating_use_case.dart';
import 'package:car_rental/features/passenger/ride/presentation/manager/rating_cubit/rating_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatingCubit extends Cubit<RatingStates> {
  RatingCubit(this.ratingUseCase) : super(InitialRatingState());
  static RatingCubit get(context) => BlocProvider.of(context);

  final RatingUseCase ratingUseCase;
  void updateRating(
      {required String uid,
      required double rate,
      required BuildContext context}) async {
    emit(LoadingUpdateRatingState());
    String message = await ratingUseCase.updateRating(uid: uid, rate: rate);
    if (message == 'updated') {
      emit(SuceesUpdateRatingState());
    } else {
      emit(ErrorUpdateRatingState(message));
    }
  }
}
