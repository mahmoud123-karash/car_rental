import 'package:car_rental/features/passenger/favorite/data/models/favorite_model.dart';
import 'package:dartz/dartz.dart';

abstract class FavoriteRepo {
  Future<Either<String, List<FavoriteModel>>> getFavorites();
  void addFavorite({
    required String name,
    required double lat,
    required double lng,
    required String type,
  });

  void remove({required String uuid});
}
