import 'package:car_rental/features/passenger/find_driver/domain/repo/driver_repo.dart';
import 'package:car_rental/features/passenger/find_driver/presentation/manager/driver_cubit/driver_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import '../../views/widgets/map_marker_widget.dart';

class DriverCubit extends Cubit<DriversStates> {
  DriverCubit(this.driverRepo) : super(InitialDriverState());
  static DriverCubit get(context) => BlocProvider.of(context);

  final DriverRepo driverRepo;

  Set<Marker> markers = {};
  void getDrivers({required LatLng source}) async {
    emit(LoadingGetDriversState());
    markers.clear();
    Marker myMarker = Marker(
      markerId: const MarkerId("_myLocation"),
      icon: BitmapDescriptor.defaultMarkerWithHue(160),
      position: source,
    );
    markers.add(myMarker);
    var result = await driverRepo.getDrivers();
    result.fold(
      (error) {
        emit(ErrorGetDriversState(error));
      },
      (list) async {
        for (var element in list) {
          Marker maker = Marker(
            rotation: element.heading!.toDouble(),
            markerId: MarkerId(
              element.lat.toString(),
            ),
            icon: await const MapMarkerWidget().toBitmapDescriptor(
              logicalSize: const Size(150, 150),
              imageSize: const Size(150, 150),
            ),
            position: LatLng(element.lat!, element.lng!),
          );
          markers.add(maker);
        }
        emit(SuccessGetDriversState(list));
      },
    );
  }
}
