import 'package:car_rental/features/driver/ride/domain/repo/ride_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'passenger_states.dart';

class PassengerCubit extends Cubit<PassengerStates> {
  PassengerCubit(this.rideRepo) : super(InitialPassengerState());
  static PassengerCubit get(context) => BlocProvider.of(context);
  final RideRepo rideRepo;
  void getPassenger({required String uid}) async {
    emit(LoadingGetPassengerState());

    var result = await rideRepo.getPassenger(uid: uid);

    result.fold((message) {
      emit(ErrorGetPassengerState(message));
    }, (model) {
      emit(SucessGetPassengerState(model));
    });
  }
}
