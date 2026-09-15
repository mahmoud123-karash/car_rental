import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:location/location.dart';

class LocationUseCase {
  Future<Either<String, Stream<LocationData>>> locate() async {
    Location location = Location();
    InternetConnectionChecker internetConnectionChecker =
        InternetConnectionChecker.instance;

    PermissionStatus? permission;
    bool serviceEnabled;

    if (!await internetConnectionChecker.hasConnection) {
      return left('No Internet Connection');
    }

    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return left('Location Service Is  Disabled');
    } else {
      permission = await location.requestPermission();
    }

    permission = await location.hasPermission();
    if (permission == PermissionStatus.denied ||
        permission == PermissionStatus.deniedForever) {
      return left('Permission Is Denied');
    } else {
      Stream<LocationData> position = location.onLocationChanged;
      return right(position);
    }
  }
}
