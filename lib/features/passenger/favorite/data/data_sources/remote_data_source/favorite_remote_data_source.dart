import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/passenger/favorite/data/models/favorite_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FavoriteRemoteDataSource {
  Future<List<FavoriteModel>> get();
}

class FavoriteRemoteDataSourceImpl extends FavoriteRemoteDataSource {
  @override
  Future<List<FavoriteModel>> get() async {
    String uid = CacheHelper.getData(key: 'uid');
    var data = await FirebaseFirestore.instance
        .collection('Passengers')
        .doc(uid)
        .collection(
          'Favorites',
        )
        .get();
    List<FavoriteModel> favorites = [];
    for (var element in data.docs) {
      FavoriteModel model = FavoriteModel.fromJson(element.data());
      favorites.add(model);
    }
    return favorites;
  }
}
