import 'package:car_rental/core/shared/components.dart';
import 'package:car_rental/features/passenger/favorite/domain/repo/favorite_repo.dart';
import 'package:car_rental/features/passenger/favorite/domain/use_cases/add_favorite_use_case.dart';
import 'package:car_rental/features/passenger/favorite/domain/use_cases/delete_favorite_use_case.dart';
import 'package:car_rental/features/passenger/favorite/presentation/manager/favorite_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit(
    this.addFavoriteUseCase,
    this.favoriteRepo,
    this.deleteFavoriteUseCase,
  ) : super(InitialFavoriteState());
  static FavoriteCubit get(context) => BlocProvider.of(context);

  final AddFavoriteUseCase addFavoriteUseCase;
  final FavoriteRepo favoriteRepo;
  final DeleteFavoriteUseCase deleteFavoriteUseCase;

  void getFavorites() async {
    emit(LoadingFavoriteState());
    var result = await favoriteRepo.getFavorites();
    result.fold((error) {
      emit(ErrorFavoriteState(error));
    }, (list) {
      emit(SuccessFavoriteState(list));
    });
  }

  void addFavorite({
    required String name,
    required double lat,
    required double lng,
    required String type,
  }) async {
    emit(LoadingFavoriteState());
    var result = await addFavoriteUseCase.add(
      name: name,
      lat: lat,
      lng: lng,
      type: type,
    );
    result.fold((error) {
      emit(ErrorFavoriteState(error));
    }, (list) {
      emit(SuccessFavoriteState(list));
    });
  }

  void deleteFavorite({required String uid}) async {
    emit(LoadingFavoriteState());
    var result = await deleteFavoriteUseCase.remove(uid: uid);
    result.fold((error) {
      emit(ErrorFavoriteState(error));
    }, (list) {
      showToast('Deleted');
      emit(SuccessFavoriteState(list));
    });
  }
}
