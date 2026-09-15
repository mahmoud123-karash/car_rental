import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/driver/settings/domain/entities/driver_entity.dart';
import 'package:hive_flutter/adapters.dart';

abstract class SettingsLocalDataSource {
  List<DriverEntity> saveModel();
}

class SettingsLocalDataSourceImpl extends SettingsLocalDataSource {
  @override
  List<DriverEntity> saveModel() {
    var box = Hive.box<DriverEntity>(driverBox);
    return box.values.toList();
  }
}
