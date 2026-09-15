import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/driver/car/data/models/car_model.dart';
import 'package:car_rental/features/driver/car/domain/repo/car_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarRepoImpl extends CarRepo {
  @override
  Future<String> updateCar({
    required String brand,
    required int color,
    required String carModel,
    required int year,
  }) async {
    try {
      String uid = CacheHelper.getData(key: 'uid');
      CarModel model = CarModel(
        brand: brand,
        color: color,
        model: carModel,
        year: year,
      );
      await FirebaseFirestore.instance.collection('Drivers').doc(uid).update(
        {
          'car': model.toJson(),
          'carCompleted': true,
        },
      );

      return 'updated';
    } catch (e) {
      return e.toString();
    }
  }
}
