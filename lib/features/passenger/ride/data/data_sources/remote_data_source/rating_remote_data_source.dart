import 'package:car_rental/features/passenger/ride/data/models/rating_model/rating_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class RatingRemoteDataSource {
  Future<RatingModel> get({required String uid});
}

class RatingRemoteDataSourceImpl extends RatingRemoteDataSource {
  @override
  Future<RatingModel> get({required String uid}) async {
    var result =
        await FirebaseFirestore.instance.collection('Drivers').doc(uid).get();
    RatingModel rating = RatingModel.fromJson(result.data()!);

    return rating;
  }
}
