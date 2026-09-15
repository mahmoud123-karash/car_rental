import 'package:car_rental/features/driver/settings/data/data_sources/local_data_source/settings_local_data_source.dart';
import 'package:car_rental/features/driver/settings/data/data_sources/remote_data_source/settings_remote_data_source.dart';
import 'package:car_rental/features/driver/settings/domain/entities/driver_entity.dart';
import 'package:car_rental/features/driver/settings/domain/repo/profile_repo.dart';
import 'package:dartz/dartz.dart';

class SettingsRepoImpl extends SettingsRepo {
  final SettingsRemoteDataSource settingsRemoteDataSource;
  final SettingsLocalDataSource settingsLocalDataSource;

  SettingsRepoImpl(this.settingsRemoteDataSource, this.settingsLocalDataSource);
  @override
  Future<Either<String, DriverEntity>> getDriverData() async {
    try {
      List<DriverEntity> drivers = settingsLocalDataSource.saveModel();
      if (drivers.isNotEmpty) {
        return right(drivers.first);
      } else {
        DriverEntity remoteModel = await settingsRemoteDataSource.get();
        return right(remoteModel);
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
