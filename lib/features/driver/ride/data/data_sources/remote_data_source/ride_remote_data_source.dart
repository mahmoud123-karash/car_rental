import 'package:car_rental/features/driver/ride/data/models/passenger_model.dart';
import 'package:car_rental/features/driver/ride/data/models/pay_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class RideRemoteDataSource {
  Future<PassengerModel> get({required String uid});
  Future<PayModel> getRide({required String uid});
}

class RideRemoteDataSourceImpl extends RideRemoteDataSource {
  @override
  Future<PassengerModel> get({required String uid}) async {
    var result = await FirebaseFirestore.instance
        .collection("Passengers")
        .doc(uid)
        .get();

    PassengerModel model = PassengerModel.fromJson(result.data()!);
    return model;
  }

  @override
  Future<PayModel> getRide({required String uid}) async {
    var result =
        await FirebaseFirestore.instance.collection("Rides").doc(uid).get();

    PayModel model = PayModel.fromJson(result.data()!);
    return model;
  }
}
