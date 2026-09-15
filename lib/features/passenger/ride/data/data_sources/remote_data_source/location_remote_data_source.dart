import 'package:car_rental/core/api/dio_helper.dart';
import 'package:car_rental/features/passenger/ride/data/models/location_model/driver_model.dart';
import 'package:car_rental/features/passenger/ride/data/models/travel_model/travel_model.dart';
import 'package:car_rental/features/passenger/ride/domain/entities/time_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_widget/google_maps_widget.dart';

abstract class LocationRemoteDataSource {
  Future<DriverModel> get({required String uid});
  Future<TimeEntity> getTime({
    required LatLng source,
    required LatLng destination,
  });
}

class LocationRemoteDataSourceImpl extends LocationRemoteDataSource {
  final DioHelper dioHelper;

  LocationRemoteDataSourceImpl(this.dioHelper);
  @override
  Future<DriverModel> get({
    required String uid,
  }) async {
    var data =
        await FirebaseFirestore.instance.collection('Drivers').doc(uid).get();
    DriverModel location = DriverModel.fromJson(data.data()!);

    return location;
  }

  @override
  Future<TimeEntity> getTime({
    required LatLng source,
    required LatLng destination,
  }) async {
    var response =
        await dioHelper.getTravelIfo(source: source, destination: destination);
    TimeEntity time = TravelModel.fromJson(response.data);

    return time;
  }
}
