import 'package:car_rental/features/passenger/ride/data/data_sources/remote_data_source/location_remote_data_source.dart';
import 'package:car_rental/features/passenger/ride/data/models/location_model/driver_model.dart';
import 'package:car_rental/features/passenger/ride/domain/entities/time_entity.dart';
import 'package:car_rental/features/passenger/ride/domain/repo/location_repo.dart';
import 'package:google_maps_widget/google_maps_widget.dart';

class LocationRepoImpl extends LocationRepo {
  final LocationRemoteDataSource locationRemoteDataSource;

  LocationRepoImpl(this.locationRemoteDataSource);
  @override
  Future<DriverModel> getLocation({
    required String uid,
  }) async {
    DriverModel model = await locationRemoteDataSource.get(uid: uid);
    return model;
  }

  @override
  Future<TimeEntity> getTime({
    required LatLng source,
    required LatLng destination,
  }) async {
    TimeEntity time = await locationRemoteDataSource.getTime(
        source: source, destination: destination);
    return time;
  }
}
