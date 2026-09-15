import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/features/passenger/home/doamin/use_cases/location_use_caser.dart';
import 'package:car_rental/features/passenger/home/presentation/manager/location_cubit/location_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationCubit extends Cubit<LocationStates> {
  LocationCubit(this.locationUseCase) : super(InitialLocatonState());

  static LocationCubit get(context) => BlocProvider.of(context);

  final LocationUseCase locationUseCase;

  void getMylocation() async {
    emit(LocatonChangedLoadingState());
    var result = await locationUseCase.locate();
    result.fold((message) {
      emit(LocatonChangedErrorState(message));
    }, (Stream<LocationData> posision) {
      posision.listen((event) {
        saveLat(event.latitude);
        saveLng(event.longitude);
        LatLng myLocation = LatLng(event.latitude, event.longitude);
        emit(LocatonChangedSuccessState(myLocation));
      });
    });
  }
}
