import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/passenger/find_driver/data/data_sources/remote_data_source/ride_remote_data_source.dart';
import 'package:car_rental/features/passenger/find_driver/data/models/ride_model/ride_model.dart';
import 'package:car_rental/features/passenger/find_driver/domain/repo/ride_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class RideRepoImpl extends RideRepo {
  final RideRemoteDataSource rideRemoteDataSource;

  RideRepoImpl(this.rideRemoteDataSource);
  @override
  void requestDriver({
    required String paymentMethod,
    required double latS,
    required double latD,
    required double lngS,
    required double lngD,
    required String driverUid,
    required String passengerUid,
  }) async {
    var uid = const Uuid().v4();
    saveRideUid(uid);
    String sAddress = CacheHelper.getData(key: 'saddress') ?? '';
    String dAddress = CacheHelper.getData(key: 'daddress') ?? '';
    String price = CacheHelper.getData(key: 'price') ?? '';
    RideModel model = RideModel(
      isHere: false,
      isPayed: false,
      isArrived: false,
      time: Timestamp.now(),
      rideUid: uid,
      dAddress: dAddress,
      price: price,
      sAddress: sAddress,
      rideStatus: 'new',
      paymentMethod: paymentMethod,
      latS: latS,
      latD: latD,
      lngS: lngS,
      lngD: lngD,
      driverUid: driverUid,
      passengerUid: passengerUid,
    );
    await FirebaseFirestore.instance.collection('Rides').doc(uid).set(
          model.toJson(),
        );
  }

  @override
  void updateRideStatus() async {
    String uid = CacheHelper.getData(key: 'rideuid');
    await FirebaseFirestore.instance.collection('Rides').doc(uid).update({
      'rideStatus': 'Cancelled',
    });
  }

  @override
  Future<RideModel> getRide() async {
    RideModel model = await rideRemoteDataSource.get();
    return model;
  }
}
