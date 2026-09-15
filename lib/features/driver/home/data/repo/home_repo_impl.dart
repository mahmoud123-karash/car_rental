import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/driver/home/data/data_sources/remote_data_source/complete_remote_data_source.dart';
import 'package:car_rental/features/driver/home/data/data_sources/remote_data_source/request_remote_data_source.dart';
import 'package:car_rental/features/driver/home/data/models/complete_model/complete_model.dart';
import 'package:car_rental/features/driver/home/data/models/request_model/request_model.dart';
import 'package:car_rental/features/driver/home/domain/repo/home_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:location/location.dart';

class HomeRepoIml extends HomeRepo {
  final CompleteRemoteDataSource completeRemoteDataSource;
  final RequestRemoteDataSource requestRemoteDataSource;

  HomeRepoIml(this.completeRemoteDataSource, this.requestRemoteDataSource);

  @override
  Future<Either<String, CompelteModel>> getData() async {
    try {
      CompelteModel model = await completeRemoteDataSource.get();
      return right(model);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Stream<LocationData> getMylocation() {
    Location location = Location();
    Stream<LocationData> position = location.onLocationChanged;
    return position;
  }

  @override
  void updateLocation({
    required double lat,
    required double lng,
    required double heading,
  }) async {
    String uid = CacheHelper.getData(key: 'uid') ?? '';
    if (uid != '') {
      await FirebaseFirestore.instance.collection('Drivers').doc(uid).update({
        "lat": lat,
        "lng": lng,
        'heading': heading,
        'online': true,
      });
    }
  }

  @override
  Future<Either<String, List<RequestModel>>> getRequest() async {
    try {
      List<RequestModel> list = await requestRemoteDataSource.get();

      return right(list);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<RequestModel>>> getRides() async {
    try {
      List<RequestModel> list = await requestRemoteDataSource.getRides();
      return right(list);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<RequestModel>>> cancelRequest({
    required String uid,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection(
            'Rides',
          )
          .doc(uid)
          .update({
        "rideStatus": "Cancelled",
      });
      List<RequestModel> list = await requestRemoteDataSource.get();

      return right(list);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, RequestModel>> confirmRequest({
    required String uid,
    required String driverUid,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection(
            'Rides',
          )
          .doc(uid)
          .update({
        "rideStatus": "Confirmed",
      });
      await FirebaseFirestore.instance
          .collection(
            'Drivers',
          )
          .doc(driverUid)
          .update({
        "online": false,
      });
      List<RequestModel> list = await requestRemoteDataSource.get();

      for (var element in list) {
        await FirebaseFirestore.instance
            .collection(
              'Rides',
            )
            .doc(element.rideUid)
            .update({
          "rideStatus": "Cancelled",
        });
      }

      RequestModel model =
          await requestRemoteDataSource.getConfirmedRide(rideUid: uid);
      return right(model);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
