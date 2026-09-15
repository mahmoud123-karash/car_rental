import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/features/passenger/find_driver/domain/repo/travel_repo.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/manager/travel_cubit/travel_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TravelCubit extends Cubit<TravelStates> {
  TravelCubit(this.travelRepo) : super(InitialTravelState());
  static TravelCubit get(context) => BlocProvider.of(context);

  final TravelRepo travelRepo;
  void getTravelInfo({
    required LatLng source,
    required LatLng destination,
  }) async {
    emit(LoadingGetTravelInfoState());
    var result = await travelRepo.getTravelInfo(
      source: source,
      destination: destination,
    );
    result.fold((failure) {
      emit(ErrorGetTravelInfoState(failure.message));
    }, (model) {
      String price =
          '\$${((double.parse(model.distance.split(' ')[0])) * 10).toStringAsFixed(0)}';
      saveRidePrice(price);
      saveSourceAddress(model.sourceAddress);
      saveDestinationAddress(model.destinationAddress);
      emit(SuccessGEtTravelInfoState(model));
    });
  }
}
