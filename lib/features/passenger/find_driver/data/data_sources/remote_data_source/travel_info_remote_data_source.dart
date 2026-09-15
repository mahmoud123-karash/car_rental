import 'package:car_rental/core/api/dio_helper.dart';
import 'package:car_rental/features/passenger/find_driver/data/models/travel_model/travel_model.dart';
import 'package:car_rental/features/passenger/find_driver/domain/entities/travel_entity.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class TravelInfoRemoteDataSource {
  Future<TravelEntity> get({
    required LatLng source,
    required LatLng destination,
  });
}

class TravelInfoRemoteDataSourceImpl extends TravelInfoRemoteDataSource {
  final DioHelper dioHelper;

  TravelInfoRemoteDataSourceImpl(this.dioHelper);
  @override
  Future<TravelEntity> get({
    required LatLng source,
    required LatLng destination,
  }) async {
    var response = await dioHelper.getTravelIfo(
      source: source,
      destination: destination,
    );
    TravelEntity model = TravelModel.fromJson(response.data);

    return model;
  }
}
