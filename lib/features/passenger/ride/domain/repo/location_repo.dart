import 'package:car_rental/features/passenger/ride/data/models/location_model/driver_model.dart';
import 'package:car_rental/features/passenger/ride/domain/entities/time_entity.dart';
import 'package:google_maps_widget/google_maps_widget.dart';

abstract class LocationRepo {
  Future<DriverModel> getLocation({
    required String uid,
  });
  Future<TimeEntity> getTime({
    required LatLng source,
    required LatLng destination,
  });
}
