import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/passenger/history/data/models/history_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HistoryRemoteDataSource {
  Future<List<HistoryModel>> get();
}

class HistoryRemoteDataSourceImpl extends HistoryRemoteDataSource {
  @override
  Future<List<HistoryModel>> get() async {
    List<HistoryModel> models = [];
    String uid = CacheHelper.getData(key: 'uid');
    var data = await FirebaseFirestore.instance
        .collection('Rides')
        .where('passengerUid', isEqualTo: uid)
        .orderBy('time', descending: true)
        .get();
    for (var element in data.docs) {
      models.add(HistoryModel.fromJson(element.data()));
    }

    return models;
  }
}
