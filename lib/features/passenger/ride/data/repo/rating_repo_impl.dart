import 'package:car_rental/features/passenger/ride/data/data_sources/remote_data_source/rating_remote_data_source.dart';
import 'package:car_rental/features/passenger/ride/data/models/rating_model/rating_model.dart';
import 'package:car_rental/features/passenger/ride/domain/repo/rating_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RatingRepoImpl extends RatingRepo {
  final RatingRemoteDataSource ratingRemoteDataSource;

  RatingRepoImpl(this.ratingRemoteDataSource);
  @override
  Future<RatingModel> get({required String uid}) async {
    RatingModel rating = await ratingRemoteDataSource.get(uid: uid);
    return rating;
  }

  @override
  void updateRating({required String uid, required List<double> rating}) async {
    await FirebaseFirestore.instance.collection('Drivers').doc(uid).update(
      {
        "rating": rating,
      },
    );
  }
}
