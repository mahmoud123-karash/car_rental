import 'package:car_rental/features/passenger/ride/data/models/manage_model/manage_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ManageRemoteDataSource {
  Future<ManageModel> get({required String uid});
}

class ManageRemoteDataSourceImpl extends ManageRemoteDataSource {
  @override
  Future<ManageModel> get({required String uid}) async {
    var result =
        await FirebaseFirestore.instance.collection('Rides').doc(uid).get();
    ManageModel model = ManageModel.fromJson(result.data()!);

    return model;
  }
}
