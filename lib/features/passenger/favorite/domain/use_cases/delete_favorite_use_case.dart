import 'package:car_rental/features/passenger/favorite/data/models/favorite_model.dart';
import 'package:car_rental/features/passenger/favorite/domain/repo/favorite_repo.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase {
  Future<Either<String, List<FavoriteModel>>> remove({
    required String uid,
  });
}

class DeleteFavoriteUseCase extends UseCase {
  final FavoriteRepo favoriteRepo;

  DeleteFavoriteUseCase(this.favoriteRepo);
  @override
  Future<Either<String, List<FavoriteModel>>> remove({
    required String uid,
  }) async {
    try {
      List<FavoriteModel> listf = [];
      favoriteRepo.remove(uuid: uid);
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
