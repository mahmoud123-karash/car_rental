import 'package:car_rental/features/passenger/ride/data/models/rating_model/rating_model.dart';

abstract class RatingRepo {
  Future<RatingModel> get({required String uid});
  void updateRating({required String uid, required List<double> rating});
}
