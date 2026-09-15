import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/driver/history/data/models/history_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HistoryRemoteDataSource {
  Future<List<HistoryModel>> get();
}

class HistoryRemoteDataSourceImpl extends HistoryRemoteDataSource {
  @override
  Future<List<HistoryModel>> get() async {
    List<HistoryModel> list = [];
    String uid = CacheHelper.getData(key: 'uid');
    var data = await FirebaseFirestore.instance
        .collection("Rides")
        .where('driverUid', isEqualTo: uid)
        .where('rideStatus', isNotEqualTo: 'new')
        .orderBy('rideStatus')
        .orderBy('time', descending: true)
        .get();
    for (var element in data.docs) {
      HistoryModel model = HistoryModel.fromJson(element.data());
      list.add(model);
    }
    return list;
  }
}
