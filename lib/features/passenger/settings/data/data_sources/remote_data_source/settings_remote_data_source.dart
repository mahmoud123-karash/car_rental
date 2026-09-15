import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/settings/data/models/passanger_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/adapters.dart';

abstract class SettingsRemoteDataSource {
  Future<PassangerModel> get();
}

class SettingsRemoteDataSourceIMpl extends SettingsRemoteDataSource {
  @override
  Future<PassangerModel> get() async {
    String uid = CacheHelper.getData(key: 'uid');
    var data = await FirebaseFirestore.instance
        .collection('Passengers')
        .doc(uid)
        .get();
    PassangerModel model = PassangerModel.fromJson(data.data()!);
    var box = Hive.box<PassangerModel>(passengerBox);
    await box.add(model);
    return model;
  }
}
