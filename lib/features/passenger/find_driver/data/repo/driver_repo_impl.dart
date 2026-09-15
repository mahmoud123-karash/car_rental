import 'package:car_rental/features/passenger/find_driver/data/data_sources/remote_data_source/online_driver_remote_data_source.dart';
import 'package:car_rental/features/passenger/find_driver/data/models/driver_model/driver_model.dart';
import 'package:car_rental/features/passenger/find_driver/domain/repo/driver_repo.dart';
import 'package:dartz/dartz.dart';

class DriverRepoImpl extends DriverRepo {
  final OnlineDriverRemoteDataSource onlineDriverRemoteDataSource;

  DriverRepoImpl(this.onlineDriverRemoteDataSource);
  @override
  Future<Either<String, List<DriverModel>>> getDrivers() async {
    try {
      List<DriverModel> drivers = await onlineDriverRemoteDataSource.get();
      return right(drivers);
    } catch (e) {
      return left(e.toString());
    }
  }
}
