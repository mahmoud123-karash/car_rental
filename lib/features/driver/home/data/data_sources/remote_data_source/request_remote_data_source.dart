import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/driver/home/data/models/request_model/request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class RequestRemoteDataSource {
  Future<List<RequestModel>> get();
  Future<List<RequestModel>> getRides();
  Future<RequestModel> getConfirmedRide({required String rideUid});
}

class RequestRemoteDataSourceImpl extends RequestRemoteDataSource {
  @override
  Future<List<RequestModel>> get() async {
    List<RequestModel> requests = [];
    String uid = CacheHelper.getData(key: 'uid');
    var data = await FirebaseFirestore.instance
        .collection('Rides')
        .where('driverUid', isEqualTo: uid)
        .where('rideStatus', isEqualTo: 'new')
        .orderBy('time', descending: true)
        .get();
    for (var element in data.docs) {
      RequestModel model = RequestModel.fromJson(element.data());
      requests.add(model);
    }

    return requests;
  }

  @override
  Future<List<RequestModel>> getRides() async {
    List<RequestModel> requests = [];
    String uid = CacheHelper.getData(key: 'uid');
    var data = await FirebaseFirestore.instance
        .collection('Rides')
        .where('driverUid', isEqualTo: uid)
        .orderBy('time', descending: true)
        .get();

    for (var element in data.docs) {
      RequestModel model = RequestModel.fromJson(element.data());
      requests.add(model);
    }

    return requests;
  }

  @override
  Future<RequestModel> getConfirmedRide({required String rideUid}) async {
    var result =
        await FirebaseFirestore.instance.collection('Rides').doc(rideUid).get();

    RequestModel model = RequestModel.fromJson(result.data()!);

    return model;
  }
}
