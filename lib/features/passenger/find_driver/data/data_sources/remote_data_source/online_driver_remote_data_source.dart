import 'package:car_rental/features/passenger/find_driver/data/models/driver_model/driver_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class OnlineDriverRemoteDataSource {
  Future<List<DriverModel>> get();
}

class OnlineDriverRemoteDataSourceIMpl extends OnlineDriverRemoteDataSource {
  @override
  Future<List<DriverModel>> get() async {
    List<DriverModel> drivers = [];
    var data = await FirebaseFirestore.instance.collection('Drivers').get();
    for (var element in data.docs) {
      DriverModel model = DriverModel.fromJson(element.data());
      drivers.add(model);
    }
    List<DriverModel> onlineDrivers =
        drivers.where((element) => element.online == true).toList();

    return onlineDrivers;
  }
}
