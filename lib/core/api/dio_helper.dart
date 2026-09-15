import 'package:car_rental/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DioHelper {
  final Dio dio;
  String baseUri = 'https://maps.googleapis.com/maps/api/';

  DioHelper(this.dio);

  Future<Response> getTravelIfo({
    required LatLng source,
    required LatLng destination,
  }) async {
    Response response = await dio.get(
      '${baseUri}distancematrix/json?units=km&origins=${source.latitude},${source.longitude}&destinations=${destination.latitude},${destination.longitude}&key=$apiKey',
    );
    return response;
  }
}
