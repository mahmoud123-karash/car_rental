import 'package:car_rental/features/passenger/favorite/data/models/favorite_model.dart';

abstract class FavoriteStates {}

class InitialFavoriteState extends FavoriteStates {}

class LoadingFavoriteState extends FavoriteStates {}

class SuccessFavoriteState extends FavoriteStates {
  final List<FavoriteModel> list;

  SuccessFavoriteState(this.list);
}

class ErrorFavoriteState extends FavoriteStates {
  final String error;

  ErrorFavoriteState(this.error);
}
