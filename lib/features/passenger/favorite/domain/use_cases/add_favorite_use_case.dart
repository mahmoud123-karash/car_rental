import 'package:car_rental/features/passenger/favorite/data/models/favorite_model.dart';
import 'package:car_rental/features/passenger/favorite/domain/repo/favorite_repo.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase {
  Future<Either<String, List<FavoriteModel>>> add({
    required String name,
    required double lat,
    required double lng,
    required String type,
  });
}

class AddFavoriteUseCase extends UseCase {
  final FavoriteRepo favoriteRepo;

  AddFavoriteUseCase(this.favoriteRepo);
  @override
  Future<Either<String, List<FavoriteModel>>> add({
    required String name,
    required double lat,
    required double lng,
    required String type,
  }) async {
    try {
      favoriteRepo.addFavorite(
        name: name,
        lat: lat,
        lng: lng,
        type: type,
      );
      List<FavoriteModel> listf = [];
      var result = await favoriteRepo.getFavorites();
      result.fold((error) {
        return left(error);
      }, (list) {
        listf = list;
      });
      return right(listf);
    } catch (e) {
      return left(e.toString());
    }
  }
}
