import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class NavBarRepo {
  Future<Either<String, String>> update() async {
    try {
      String uid = CacheHelper.getData(key: 'uid');
      await FirebaseFirestore.instance.collection('Drivers').doc(uid).update(
        {
          'online': false,
        },
      );

      return right('updated');
    } catch (e) {
      return left(e.toString());
    }
  }
}
