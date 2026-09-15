import 'package:car_rental/features/driver/ride/domain/repo/ride_repo.dart';
import 'package:car_rental/features/driver/ride/presenattion/manager/ride_cubit/ride_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RideCubit extends Cubit<RideStates> {
  RideCubit(this.rideRepo) : super(InitialRideState());
  static RideCubit get(context) => BlocProvider.of(context);
  final RideRepo rideRepo;

  void getRide({required String uid}) async {
    emit(LoadingGetRideState());
    var result = await rideRepo.getRide(uid: uid);

    result.fold((message) {
      emit(ErrorGetRideState(message));
    }, (model) {
      emit(SucessGetRideState(model));
    });
  }

  void completeRide({required String uid}) {
    rideRepo.updateRide(uid: uid);
    emit(LoadingGetRideState());
  }
}
