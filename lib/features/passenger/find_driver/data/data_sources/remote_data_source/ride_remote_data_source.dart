import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/passenger/find_driver/data/models/ride_model/ride_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class RideRemoteDataSource {
  Future<RideModel> get();
}

class RideRemoteDataSourceImpl extends RideRemoteDataSource {
  @override
  Future<RideModel> get() async {
    String uid = CacheHelper.getData(key: 'rideuid');
    var data =
        await FirebaseFirestore.instance.collection('Rides').doc(uid).get();
    RideModel model = RideModel.fromJson(data.data()!);
    return model;
  }
}
