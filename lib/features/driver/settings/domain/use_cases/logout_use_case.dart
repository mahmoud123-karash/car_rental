import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/driver/settings/domain/entities/driver_entity.dart';
import 'package:car_rental/features/driver/settings/domain/repo/logout_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/adapters.dart';

abstract class UseCase {
  Future<Either<String, String>> logout();
}

class LogoutUseCase extends UseCase {
  final LogoutRepo logoutRepo;

  LogoutUseCase(this.logoutRepo);
  @override
  Future<Either<String, String>> logout() async {
    try {
      logoutRepo.update();
      var box = Hive.box<DriverEntity>(driverBox);
      await box.clear();
      CacheHelper.removeData(key: 'uid');
      CacheHelper.removeData(key: 'online');
      savenew(true);
      return right('updated');
    } catch (e) {
      return left(e.toString());
    }
  }
}
