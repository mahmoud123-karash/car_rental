import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/passenger/favorite/data/data_sources/remote_data_source/favorite_remote_data_source.dart';
import 'package:car_rental/features/passenger/favorite/data/models/favorite_model.dart';
import 'package:car_rental/features/passenger/favorite/domain/repo/favorite_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

class FavoriteRepoImpl extends FavoriteRepo {
  final FavoriteRemoteDataSource favoriteRemoteDataSource;

  FavoriteRepoImpl(this.favoriteRemoteDataSource);
  @override
  void addFavorite({
    required String name,
    required double lat,
    required double lng,
    required String type,
  }) {
    var uuid = const Uuid().v4();
    FavoriteModel model = FavoriteModel(
      lat: lat,
      lng: lng,
      name: name,
      uid: uuid,
      type: type,
    );
    String uid = CacheHelper.getData(key: 'uid');
    FirebaseFirestore.instance
        .collection('Passengers')
        .doc(uid)
        .collection(
          'Favorites',
        )
        .doc(uuid)
        .set(
          model.toJson(),
        );
  }

  @override
  Future<Either<String, List<FavoriteModel>>> getFavorites() async {
    try {
      List<FavoriteModel> favorites = await favoriteRemoteDataSource.get();
      return right(favorites);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  void remove({required String uuid}) {
    String uid = CacheHelper.getData(key: 'uid');
    FirebaseFirestore.instance
        .collection('Passengers')
        .doc(uid)
        .collection(
          'Favorites',
        )
        .doc(uuid)
        .delete();
  }
}
