import 'package:car_rental/features/passenger/ride/data/models/rating_model/rating_model.dart';
import 'package:car_rental/features/passenger/ride/domain/repo/rating_repo.dart';

abstract class UseCase {
  Future<String> updateRating({
    required String uid,
    required double rate,
  });
}

class RatingUseCase extends UseCase {
  final RatingRepo ratingRepo;

  RatingUseCase(this.ratingRepo);
  @override
  Future<String> updateRating({
    required String uid,
    required double rate,
  }) async {
    try {
      List<double> updatedList = [];
      RatingModel rating = await ratingRepo.get(uid: uid);
      List<double> list = rating.rating ?? [];
      updatedList = list;
      updatedList.add(rate);
      ratingRepo.updateRating(uid: uid, rating: updatedList);

      return 'updated';
    } catch (e) {
      return e.toString();
    }
  }
}
