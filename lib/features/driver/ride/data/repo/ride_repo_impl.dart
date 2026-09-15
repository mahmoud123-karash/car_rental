import 'package:car_rental/features/driver/ride/data/data_sources/remote_data_source/ride_remote_data_source.dart';
import 'package:car_rental/features/driver/ride/data/models/passenger_model.dart';
import 'package:car_rental/features/driver/ride/domain/repo/ride_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../models/pay_model.dart';

class RideRepoImpl extends RideRepo {
  final RideRemoteDataSource rideRemoteDataSource;

  RideRepoImpl(this.rideRemoteDataSource);
  @override
  Future<Either<String, PassengerModel>> getPassenger({
    required String uid,
  }) async {
    try {
      PassengerModel model = await rideRemoteDataSource.get(uid: uid);

      return right(model);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, PayModel>> getRide({
    required String uid,
  }) async {
    try {
      PayModel model = await rideRemoteDataSource.getRide(uid: uid);
      return right(model);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  void updateRide({required String uid}) {
    FirebaseFirestore.instance.collection('Rides').doc(uid).update(
      {
        "rideStatus": 'Completed',
      },
    );
  }
}
