import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LogoutRepo {
  void update() async {
    String uid = CacheHelper.getData(key: 'uid');
    bool isOnline = CacheHelper.getData(key: 'online') ?? false;
    if (isOnline) {
      await FirebaseFirestore.instance.collection('Drivers').doc(uid).update(
        {
          'online': false,
        },
      );
    }
  }
}
