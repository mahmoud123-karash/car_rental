import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/driver/home/data/models/complete_model/complete_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CompleteRemoteDataSource {
  Future<CompelteModel> get();
}

class CompleteRemoteDataSourceImpl extends CompleteRemoteDataSource {
  @override
  Future<CompelteModel> get() async {
    String uid = CacheHelper.getData(key: 'uid');
    var data =
        await FirebaseFirestore.instance.collection('Drivers').doc(uid).get();

    CompelteModel model = CompelteModel.fromJson(data.data()!);

    return model;
  }
}
