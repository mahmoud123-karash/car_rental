import 'package:car_rental/features/driver/home/data/models/request_model/request_model.dart';
import 'package:car_rental/features/driver/home/data/models/ride_model/ride_model.dart';
import 'package:car_rental/features/driver/home/domain/repo/home_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ride_states.dart';

class RideCubit extends Cubit<RideStates> {
  RideCubit(this.homeRepo) : super(InitialRideState());
  static RideCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;

  void getRides() async {
    emit(LoadingGetRidesState());

    var result = await homeRepo.getRides();

    result.fold(
      (message) {
        emit(ErrorGetRidesState(message));
      },
      (rides) {
        List<RequestModel> completedRides = rides
            .where((element) => element.rideStatus == 'Completed')
            .toList();
        List<RequestModel> todayRides = rides
            .where(
              (element) =>
                  element.time.toDate().day == Timestamp.now().toDate().day &&
                  element.time.toDate().month ==
                      Timestamp.now().toDate().month &&
                  element.time.toDate().year == Timestamp.now().toDate().year &&
                  element.rideStatus != 'new',
            )
            .toList();
        emit(
          SuccessGetRidesState(
            RideModel(
              completedRides: completedRides,
              todayRides: todayRides,
            ),
          ),
        );
      },
    );
  }
}
