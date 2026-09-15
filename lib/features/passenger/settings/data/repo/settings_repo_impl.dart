import 'package:car_rental/features/passenger/settings/data/data_sources/local_data_source/settings_local_data_source.dart';
import 'package:car_rental/features/passenger/settings/data/data_sources/remote_data_source/settings_remote_data_source.dart';
import 'package:car_rental/features/passenger/settings/data/models/passanger_model.dart';
import 'package:car_rental/features/passenger/settings/domain/repo/settings_repo.dart';
import 'package:dartz/dartz.dart';

class SettingsRepoImpl extends SettingsRepo {
  final SettingsRemoteDataSource settingsRemoteDataSource;
  final SettingsLocalDataSource settingsLocalDataSource;

  SettingsRepoImpl(this.settingsRemoteDataSource, this.settingsLocalDataSource);
  @override
  Future<Either<String, PassangerModel>> getPassenger() async {
    try {
      List<PassangerModel> locaiList = settingsLocalDataSource.get();
      if (locaiList.isNotEmpty) {
        return right(locaiList.first);
      } else {
        PassangerModel model = await settingsRemoteDataSource.get();
        return right(model);
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
