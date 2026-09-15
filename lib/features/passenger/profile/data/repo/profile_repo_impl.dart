import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/features/passenger/profile/data/models/update_model.dart';
import 'package:car_rental/features/passenger/profile/domain/repo/profile_repo.dart';
import 'package:car_rental/features/passenger/settings/data/models/passanger_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

class ProfileRepoImpl extends ProfileRepo {
  @override
  Future<String> updatePassenger({
    required String name,
    required String phone,
    required String job,
    required String gender,
  }) async {
    try {
      var box = Hive.box<PassangerModel>(passengerBox);
      await box.clear();
      String uid = CacheHelper.getData(key: 'uid');
      UpdateModel model = UpdateModel(
        name: name,
        phone: phone,
        job: job,
        gender: gender,
      );
      FirebaseFirestore.instance.collection('Passengers').doc(uid).update(
            model.toJson(),
          );
      return '';
    } catch (e) {
      return e.toString();
    }
  }
}
