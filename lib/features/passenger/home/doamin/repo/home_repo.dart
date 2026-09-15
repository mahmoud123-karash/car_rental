import 'package:car_rental/core/constants/constants.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class HomeRepo {
  Future<PolylineResult> drawLinrFSToD({
    required PointLatLng source,
    required PointLatLng destination,
  }) async {
    return await PolylinePoints(apiKey: apiKey).getRouteBetweenCoordinates(
      request: PolylineRequest(
        origin: source,
        destination: destination,
        mode: TravelMode.driving,
      ),
    );
  }
}
