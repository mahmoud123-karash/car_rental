import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/features/driver/home/domain/use_cases/location_use_case.dart';
import 'package:car_rental/features/driver/home/presentation/manager/location_cubit/location_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoctionCubit extends Cubit<LoactionStates> {
  LoctionCubit(this.locationUseCase) : super(InitialLocationState());
  static LoctionCubit get(context) => BlocProvider.of(context);
  final DriverLocationUseCase locationUseCase;

  void getLocation() async {
    emit(LoadingGetLoactionState());
    savenew(false);
    var result = await locationUseCase.locate();

    result.fold(
      (message) {
        emit(ErrorGetLoactionState(message));
      },
      (position) {
        saveOnline(true);
        position.listen(
          (event) {
            bool isOnline = CacheHelper.getData(key: 'online') ?? false;
            if (isOnline) {
              bool mission = CacheHelper.getData(key: 'mission') ?? false;
              if (!mission) {
                emit(
                  SucessGetLocationState(
                    event.latitude,
                    event.longitude,
                  ),
                );
              }
            }
          },
        );
      },
    );
  }
}
