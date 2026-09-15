import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/passenger/find_driver/domain/use_cases/request_ride_use_case.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/manager/ride_cubit/ride_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RideCubit extends Cubit<RideStates> {
  RideCubit(this.requestRideUseCase) : super(InitialRideState());
  static RideCubit get(context) => BlocProvider.of(context);

  final RequestRideUseCase requestRideUseCase;
  void requestRide({
    required double latS,
    required double latD,
    required double lngS,
    required double lngD,
    required String driverUid,
    required String passengerUid,
  }) async {
    emit(LoadingRequestRideState());
    String paymentMethod = CacheHelper.getData(key: 'method') ?? '';
    var result = await requestRideUseCase.request(
      paymentMethod: paymentMethod,
      latS: latS,
      latD: latD,
      lngS: lngS,
      lngD: lngD,
      driverUid: driverUid,
      passengerUid: passengerUid,
    );
    result.fold((message) {
      emit(ErrorRequestRideState(message));
    }, (model) {
      emit(SuccessRequestRideState(model));
    });
  }

  void getRide() async {
    emit(LoadingRequestRideState());
    var result = await requestRideUseCase.get();
    result.fold((message) {
      emit(ErrorRequestRideState(message));
    }, (model) {
      emit(SuccessRequestRideState(model));
    });
  }

  void cancelRide() {
    requestRideUseCase.cancel();
    emit(CancelRequestRideState());
  }
}
