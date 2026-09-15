import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/driver/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:location/location.dart';

abstract class UseCase {
  Future<Either<String, Stream<LocationData>>> locate();
}

class DriverLocationUseCase extends UseCase {
  final HomeRepo homeRepo;

  DriverLocationUseCase(this.homeRepo);
  @override
  Future<Either<String, Stream<LocationData>>> locate() async {
    InternetConnectionChecker internetConnectionChecker =
        InternetConnectionChecker.instance;
    Location location = Location();

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
      Stream<LocationData> position = homeRepo.getMylocation();
      position.listen((event) {
        bool isOnline = CacheHelper.getData(key: 'online') ?? false;
        if (isOnline) {
          // homeRepo.updateLocation(
          //   heading: event.heading ?? 0,
          //   lat: event.latitude ?? 0,
          //   lng: event.longitude ?? 0,
          // );
        }
      });

      return right(position);
    }
  }
}
