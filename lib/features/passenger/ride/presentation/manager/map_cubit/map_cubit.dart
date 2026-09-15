import 'package:car_rental/features/passenger/ride/domain/repo/location_repo.dart';
import 'package:car_rental/features/passenger/ride/presentation/views/widgets/driver_map_marker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:widget_to_marker/widget_to_marker.dart';
import '../../../data/models/location_model/driver_model.dart';
import 'map_states.dart';

class MapCubit extends Cubit<MapStates> {
  MapCubit(this.locationRepo) : super(InitialMapState());
  static MapCubit get(context) => BlocProvider.of(context);

  final LocationRepo locationRepo;
  Set<Marker> markers = {};
  void getLocation({
    required String uid,
    required LatLng source,
  }) async {
    emit(LoadingGetLocationState());
    try {
      DriverModel model = await locationRepo.getLocation(uid: uid);

      Marker marker = Marker(
        zIndex: 1,
        markerId: const MarkerId('_driverLocation'),
        icon: await DriverMapMarkerWidget(
          image: model.image,
          name: model.name,
        ).toBitmapDescriptor(
          logicalSize: const Size(100, 100),
          imageSize: const Size(300, 300),
        ),
        position: LatLng(model.lat, model.lng),
      );
      Marker sMarker = Marker(
        markerId: const MarkerId('_sMarker'),
        icon: BitmapDescriptor.defaultMarkerWithHue(160),
        position: LatLng(source.latitude, source.longitude),
      );
      markers.addAll([marker, sMarker]);
      emit(SuceesGetLocationState(model));
    } catch (e) {
      emit(ErrorGetLocationState(e.toString()));
    }
  }
}
