import 'package:car_rental/features/auth/data/models/driver_model.dart';
import 'package:car_rental/features/auth/data/models/passenger_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class LoginRemoteDataSource {
  Future<List<DriverModel>> getDrivers();
  Future<List<PassengerModel>> getPassengers();
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  @override
  Future<List<DriverModel>> getDrivers() async {
    var data = await FirebaseFirestore.instance.collection('Drivers').get();
    List<DriverModel> drivers = [];
    for (var element in data.docs) {
      drivers.add(DriverModel.fromJson(element.data()));
    }

    return drivers;
  }

  @override
  Future<List<PassengerModel>> getPassengers() async {
    var data = await FirebaseFirestore.instance.collection('Passengers').get();
    List<PassengerModel> passengers = [];
    for (var element in data.docs) {
      passengers.add(PassengerModel.fromJson(element.data()));
    }

    return passengers;
  }
}
