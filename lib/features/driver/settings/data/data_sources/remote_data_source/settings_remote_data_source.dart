import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/driver/settings/domain/entities/driver_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/adapters.dart';

import '../../models/driver_model/driver_model.dart';

abstract class SettingsRemoteDataSource {
  Future<DriverEntity> get();
}

class SettingsRemoteDataSourceImpl extends SettingsRemoteDataSource {
  @override
  Future<DriverEntity> get() async {
    String uid = CacheHelper.getData(key: 'uid');
    var data =
        await FirebaseFirestore.instance.collection('Drivers').doc(uid).get();

    DriverEntity model = DriverModel.fromJson(data.data()!);
    var box = Hive.box<DriverEntity>(driverBox);
    box.add(model);
    return model;
  }
}
