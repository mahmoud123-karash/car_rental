import 'package:car_rental/features/driver/ride/presenattion/manager/driver_map_cubit/driver_map_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import '../../views/widgets/map_marker_widget.dart';

class DriverMapCubit extends Cubit<DriverMapStates> {
  DriverMapCubit() : super(InitialLocationState());
  static DriverMapCubit get(context) => BlocProvider.of(context);
  Set<Marker> markers = {};
  void getLocation({required LatLng source}) async {
    emit(LoadingGetLoactionState());

    Marker sMarker = Marker(
      markerId: const MarkerId('_source'),
      icon: BitmapDescriptor.defaultMarkerWithHue(160),
      position: source,
    );
    Location location = Location();
    Stream<LocationData> position = location.onLocationChanged;
    position.listen((event) async {
      Marker dMarker = Marker(
        rotation: event.heading ?? 0,
        zIndexInt: 1,
        markerId: const MarkerId('_dMarker'),
        icon: await const MapMarkerWidget().toBitmapDescriptor(
          logicalSize: const Size(150, 150),
          imageSize: const Size(150, 150),
        ),
        position: LatLng(event.latitude, event.longitude),
      );
      if (!isClosed) {
        markers.addAll([sMarker, dMarker]);
        emit(SucessGetLocationState());
      }
    });
  }
}
